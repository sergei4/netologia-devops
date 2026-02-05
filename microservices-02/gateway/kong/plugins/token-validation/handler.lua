local http = require "resty.http"

local TokenValidation = {
  VERSION = "1.0.0",
  PRIORITY = 1000,
}

local function is_ignored_route(route, ignore_routes)
  if not route or not ignore_routes then
    return false
  end
  for _, name in ipairs(ignore_routes) do
    if route.name == name then
      return true
    end
  end
  return false
end

function TokenValidation:access(conf)
  local route = kong.router.get_route()
  if is_ignored_route(route, conf.ignore_routes) then
    return
  end

  local auth = kong.request.get_header("Authorization")
  if not auth or auth == "" then
    return kong.response.exit(401, { message = "Unauthorized" })
  end

  local httpc = http.new()
  httpc:set_timeouts(conf.connect_timeout, conf.read_timeout, conf.write_timeout)
  local res, err = httpc:request_uri(conf.validation_url, {
    method = "GET",
    headers = { ["Authorization"] = auth },
    keepalive_timeout = 60000,
    keepalive_pool = 10,
  })

  if not res then
    kong.log.err("token validation request failed: ", err)
    return kong.response.exit(503, { message = "Validation service unavailable" })
  end

  if res.status ~= 200 then
    return kong.response.exit(401, { message = "Unauthorized" })
  end
end

return TokenValidation