local M = {
  build_number = os.getenv('BUILD_NUMBER') or 'local',
  logging_level = os.getenv('LOGGING_LEVEL') or 'debug'
}

return M
