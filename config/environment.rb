require "pathname"


APP_ROOT = Pathname.new(File.expand_path("../../", __FILE__))

Dir[APP_ROOT.join("app/models/**/*.rb")].each { |file| require file }

