require 'bundler'
require 'tty-prompt'
require 'colorize'
require 'ruby2d'
Bundler.require
require_all 'app'
require_all 'modules'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

