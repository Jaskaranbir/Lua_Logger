local cjson = require('cjson')
local socket = require('socket')

local config = require('./config')
local utils = require('./utils')

local log_map = utils.log_map

local log = {
  trace = function(message, refUUID, offset) logger(message, refUUID, offset, log_map.trace) end
}

function logger(message, refUUID, offset, log_level)
  if (type(message) == 'string') then
    message = {
      description = message
    }
  end

  out = cjson.encode({
    id = utils.__UUID__(),
    application = 'P-Layer-Nginx-ES',
    build_number = config.build_number,
    class = '',
    file_name = __FILE__(offset),
    level = config.logging_level,
    line_number = __LINE__(offset),
    message = message,
    method_name = __FUNC__(offset),
    reference = (refUUID or ''),
    time = math.floor(socket.gettime() * 1000)
  })

  print(out)
  return out
end


-- Temporary tests
function test(o)
print(log.trace('asdf', '', o))
end

function t()
test(1)
end

t()