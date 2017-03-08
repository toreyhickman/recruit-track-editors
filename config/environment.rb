require "dotenv"
Dotenv.load

require "pathname"
require "httparty"

APP_ROOT = Pathname.new(File.expand_path("../../", __FILE__))
APP_NAME = APP_ROOT.basename.to_s

Dir[APP_ROOT.join("app/models/**/*.rb")].each { |file| require file }

