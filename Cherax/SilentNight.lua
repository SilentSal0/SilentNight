--#region JSON Parser

-- Modified version of https://github.com/rxi/json.lua

local json = {}

local escape_char_map = {
    ["\\"] = "\\",
    ["\""] = "\"",
    ["\b"] = "b",
    ["\f"] = "f",
    ["\n"] = "n",
    ["\r"] = "r",
    ["\t"] = "t",
}

local escape_char_map_inv = { ["/"] = "/" }
for k, v in pairs(escape_char_map) do
    escape_char_map_inv[v] = k
end

local parse

local function create_set(...)
    local res = {}

    for i = 1, select("#", ...) do
        res[select(i, ...)] = true
    end

    return res
end

local space_chars  = create_set(" ", "\t", "\r", "\n")
local delim_chars  = create_set(" ", "\t", "\r", "\n", "]", "}", ",")
local escape_chars = create_set("\\", "/", '"', "b", "f", "n", "r", "t", "u")
local literals     = create_set("true", "false", "null")

local literal_map  = {
    ["true"] = true,
    ["false"] = false,
    ["null"] = nil,
}

local function next_char(str, idx, set, negate)
    for i = idx, #str do
        if set[str:sub(i, i)] ~= negate then
            return i
        end
    end

    return #str + 1
end

local function decode_error(str, idx, msg)
    local line_count = 1
    local col_count = 1

    for i = 1, idx - 1 do
        col_count = col_count + 1
        if str:sub(i, i) == "\n" then
            line_count = line_count + 1
            col_count = 1
        end
    end

    error(string.format("%s at line %d col %d", msg, line_count, col_count))
end

local function codepoint_to_utf8(n)
    local f = math.floor

    if n <= 0x7f then
        return string.char(n)
    elseif n <= 0x7ff then
        return string.char(f(n / 64) + 192, n % 64 + 128)
    elseif n <= 0xffff then
        return string.char(f(n / 4096) + 224, f(n % 4096 / 64) + 128, n % 64 + 128)
    elseif n <= 0x10ffff then
        return string.char(f(n / 262144) + 240, f(n % 262144 / 4096) + 128, f(n % 4096 / 64) + 128, n % 64 + 128)
    end

    error(string.format("invalid unicode codepoint '%x'", n))
end

local function parse_unicode_escape(s)
    local n1 = tonumber(s:sub(1, 4), 16)
    local n2 = tonumber(s:sub(7, 10), 16)

    if n2 then
        return codepoint_to_utf8((n1 - 0xd800) * 0x400 + (n2 - 0xdc00) + 0x10000)
    else
        return codepoint_to_utf8(n1)
    end
end

local function parse_string(str, i)
    local res = ""
    local j = i + 1
    local k = j

    while j <= #str do
        local x = str:byte(j)

        if x < 32 then
            decode_error(str, j, "control character in string")

        elseif x == 92 then -- `\`: Escape
            
            res = string.format("%s%s", res, str:sub(k, j - 1))
            j = j + 1
            local c = str:sub(j, j)

            if c == "u" then
                local hex = str:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", j + 1) or str:match("^%x%x%x%x", j + 1) or decode_error(str, j - 1, "invalid unicode escape in string")
                res = string.format("%s%s", res, parse_unicode_escape(hex))
                j = j + #hex
            else
                if not escape_chars[c] then
                    decode_error(str, j - 1, "invalid escape char '%s' in string", c)
                end

                res = string.format("%s%s", res, escape_char_map_inv[c])
            end

            k = j + 1

        elseif x == 34 then -- `"`: End of string
            res = string.format("%s%s", res, str:sub(k, j - 1))
            return res, j + 1
        end

        j = j + 1
    end

    decode_error(str, i, "expected closing quote for string")
end

local function parse_number(str, i)
    local x = next_char(str, i, delim_chars)
    local s = str:sub(i, x - 1)
    local n = tonumber(s)

    if not n then
        decode_error(str, i, string.format('invalid number "%s"', tostring(s)))
    end

    return n, x
end

local function parse_literal(str, i)
    local x = next_char(str, i, delim_chars)
    local word = str:sub(i, x - 1)

    if not literals[word] then
        decode_error(str, i, string.format('invalid literal "%s"', tostring(word)))
    end

    return literal_map[word], x
end

local function parse_array(str, i)
    local res = {}
    local n = 1
    i = i + 1

    while 1 do

        local x
        i = next_char(str, i, space_chars, true)

        if str:sub(i, i) == "]" then
            i = i + 1
            break
        end

        x, i = parse(str, i)
        res[n] = x
        n = n + 1
        i = next_char(str, i, space_chars, true)
        local chr = str:sub(i, i)
        i = i + 1

        if chr == "]" then 
            break
        end

        if chr ~= "," then
            decode_error(str, i, "expected ']' or ','")
        end

    end

    return res, i
end

local function parse_object(str, i)
    local res = {}
    i = i + 1
    while 1 do
        local key, val
        i = next_char(str, i, space_chars, true)

        if str:sub(i, i) == "}" then
            i = i + 1
            break
        end

        if str:sub(i, i) ~= '"' then
            decode_error(str, i, "expected string for key")
        end

        key, i = parse(str, i)
        i = next_char(str, i, space_chars, true)

        if str:sub(i, i) ~= ":" then
            decode_error(str, i, "expected ':' after key")
        end

        i = next_char(str, i + 1, space_chars, true)
        val, i = parse(str, i)
        res[key] = val
        i = next_char(str, i, space_chars, true)
        local chr = str:sub(i, i)
        i = i + 1

        if chr == "}" then 
            break 
        end

        if chr ~= "," then 
            decode_error(str, i, "expected '}' or ','") 
        end
    end

    return res, i
end

local char_func_map = {
    ['"'] = parse_string,
    ["0"] = parse_number,
    ["1"] = parse_number,
    ["2"] = parse_number,
    ["3"] = parse_number,
    ["4"] = parse_number,
    ["5"] = parse_number,
    ["6"] = parse_number,
    ["7"] = parse_number,
    ["8"] = parse_number,
    ["9"] = parse_number,
    ["-"] = parse_number,
    ["t"] = parse_literal,
    ["f"] = parse_literal,
    ["n"] = parse_literal,
    ["["] = parse_array,
    ["{"] = parse_object,
}

parse = function(str, idx)
    local chr = str:sub(idx, idx)
    local f = char_func_map[chr]

    if f then
        return f(str, idx)
    end

    decode_error(str, idx, string.format('unexpected character "%s"', chr))
end

function json.decode(str)
    if type(str) ~= "string" then
        error(string.format("expected argument of type string, got %s", type(str)))
    end

    local res, idx = parse(str, next_char(str, 1, space_chars, true))

    idx = next_char(str, idx, space_chars, true)
    if idx <= #str then
        decode_error(str, idx, "trailing garbage")
    end

    return res
end

--#endregion

local hasReachedRatelimit = false
local mainURL             = "https://api.github.com/repos/SilentSal0/SilentNight/contents/Cherax"
local commitsUrl          = "https://api.github.com/repos/SilentSal0/SilentNight/commits"
local rootPath            = string.format("%s\\Lua\\SilentNight", FileMgr.GetMenuRootPath())
local shaPath             = string.format("%s\\sha.txt", rootPath)

local function LogError(text)
    Logger.LogError(text)
    GUI.AddToast("Silent Night", text, 6000, eToastPos.TOP_RIGHT)
end

local function GetFileNameFromURL(url)
    return url:match("^.+/(.+)$")
end

local function GetLatestCommitShaHash()
    local curl = Curl.Easy()

    curl:Setopt(eCurlOption.CURLOPT_URL, commitsUrl)
    curl:AddHeader("user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 OPR/105.0.0.0")
    curl:Perform()
    
    while not curl:GetFinished() do
        Script.Yield(10)
    end

    local curlCode, body = curl:GetResponse()
    if curlCode ~= eCurlCode.CURLE_OK then
        LogError(("CURL response was on OK: %d"):format(curlCode))
        return "", false
    end

    if body:match('"message":"API rate limit exceeded') then
        hasReachedRatelimit = true
        LogError("GitHub API rate limit exceeded. Please wait and try again later")
        return "", false
    end

    local data = json.decode(body)

    local object = data[1]
    if object == nil then
        return "", false
    end

    if object.sha == nil then
        return "", false
    end

    return object.sha, true
end

local function GetGithubData(url)
    url = url:gsub(" ", "%%20")

    local curl = Curl.Easy()

    curl:Setopt(eCurlOption.CURLOPT_URL, url)
    curl:AddHeader("user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36")
    curl:Perform()
    
    while not curl:GetFinished() do
        Script.Yield(10)
    end

    local curlCode, body = curl:GetResponse()
    if curlCode ~= eCurlCode.CURLE_OK then
        LogError(("CURL response was on OK: %d"):format(curlCode))
        return "", false
    end
    
    if type(body) ~= "string" then
        LogError("Body is not a valid string")
        return "", false
    end

    if body:match('"message":"API rate limit exceeded') then
        hasReachedRatelimit = true
        LogError("GitHub API rate limit exceeded. Please wait and try again later")
        return "", false
    end

    return body, true
end

local function GetFileContent(url)
    url = url:gsub(" ", "%%20")

    local curl = Curl.Easy()
    
    curl:Setopt(eCurlOption.CURLOPT_URL, url)
    curl:AddHeader("user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 OPR/105.0.0.0")
    curl:Perform()
    
    while not curl:GetFinished() do
        Script.Yield(10)
    end

    local curlCode, body = curl:GetResponse()

    if curlCode ~= eCurlCode.CURLE_OK then
        LogError(("CURL response was on OK for downloading (): %d"):format(url, curlCode))
        return "", false
    end

    return body, true
end

local totalFiles = 0
local fileStructure = {}

local function ParseGithubDirectory(url, currentPath)
    local body, success = GetGithubData(url)
    if not success then
        return
    end

    local decoded = json.decode(body)

    for _, data in pairs(decoded) do
        if data.type == "file" then
            totalFiles = totalFiles + 1
            if not fileStructure[currentPath] then
                fileStructure[currentPath] = {}
            end
            table.insert(fileStructure[currentPath], data.download_url) 
        elseif data.type == "dir" then
            local dirURL = string.format("%s\\%s", url, data.name)
            local path = string.format("%s\\%s", currentPath, data.name)
            ParseGithubDirectory(dirURL, path)
        end
    end
end

local function Download()
    local downloadedFileCount = 0

    ParseGithubDirectory(mainURL, rootPath)

    for path, data in pairs(fileStructure) do
        if not FileMgr.DoesFileExist(path) then
            FileMgr.CreateDir(path)
        end

        for _, downloadUrl in pairs(data) do
            if hasReachedRatelimit then
                return
            end

            local content, success = GetFileContent(downloadUrl)
            if not success then
                LogError("Failed to download file")
                return
            end

            local filePath = string.format("%s\\%s", path, GetFileNameFromURL(downloadUrl))
            FileMgr.WriteFileContent(filePath, content, false)

            downloadedFileCount = downloadedFileCount + 1
            Logger.Log(eLogColor.GREEN, "Silent Night", ("Downloaded %d / %d files"):format(downloadedFileCount, totalFiles))
        end
    end

    local shaHash, _ = GetLatestCommitShaHash()
    FileMgr.WriteFileContent(shaPath, shaHash, false)

end

local function IsUpToDate()
    local latestCommitShaHash, success = GetLatestCommitShaHash()

    if not success then
        LogError("Failed to verify if current installed version of Silent Night is up-to-date")
        return nil
    end

    if not FileMgr.DoesFileExist(shaPath) then
        Logger.Log(eLogColor.YELLOW, "Silent Night", "Downloading Silent Night")
        return false
    end

    local localShaHash = FileMgr.ReadFileContent(shaPath)

    if localShaHash ~= latestCommitShaHash then
        Logger.Log(eLogColor.YELLOW, "Silent Night", "Version is outdated")
        return false
    end

    Logger.Log(eLogColor.GREEN, "Silent Night", "Version is up-to-date")

    return true
end

local function DeleteOld()
    local extentsions = {".lua", ".txt"}

    for _, extentsion in ipairs(extentsions) do
        local files = FileMgr.FindFiles(rootPath, extentsion, true)
        for _, path in pairs(files) do
            FileMgr.DeleteFile(path)
        end
    end
end

local function ExecuteMain()
    local path = string.format("%s\\RunScript.lua", rootPath)
    
    if not FileMgr.DoesFileExist(path) then
        LogError("Failed to start main file")
        return
    end

    dofile(path)
end

Script.QueueJob(function()
    if IsUpToDate() ~= false then
        ExecuteMain()
        return
    end

    if not hasReachedRatelimit then
        DeleteOld()
        Download()
        ExecuteMain()
        return
    end

    LogError("Failed to download Silent Night")
end)