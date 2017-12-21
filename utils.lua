local socket = require('socket')
local uuid = require('uuid')

function __FILE__(offset)
  offset = offset or 0
  return debug.getinfo((2 + offset), 'S').source
end

function __LINE__(offset)
  offset = offset or 0
  return debug.getinfo((3 + offset), 'l').currentline
end

function __FUNC__(offset)
  offset = offset or 0
  return (debug.getinfo((3 + offset), 'n').name or '')
end

function __UUID__()
  uuid.seed()
  return uuid()
end


local log_map = {
  [5] = error,
  [4] = warn,
  [3] = debug,
  [2] = info,
  [1] = trace
}

return {
  __FILE__ = __FILE__,
  __FUNC__ = __FUNC__,
  __LINE__ = __LINE__,
  __UUID__ = __UUID__,
  log_map = log_map
}
