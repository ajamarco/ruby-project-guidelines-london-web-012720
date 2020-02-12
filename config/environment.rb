require 'bundler'
require 'tty-prompt'
require 'tty-box'
require 'colorize'
require 'ruby2d'
require 'tty-table'
require 'catpix'
Bundler.require
require_all 'app'
require_all 'modules'

#ActiveRecord::Base.logger.level = 1 
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

