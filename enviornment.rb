require 'bundler'
require 'require_all'
Bundler.require

require_all '.'

DB = {:conn => SQLite3::Database.new("drinks.db")}
