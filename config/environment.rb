require 'bundler'
require 'tty-prompt'
require 'tty-box'
require 'colorize'
require 'ruby2d'
Bundler.require
require_all 'app'
require_all 'modules'

ActiveRecord::Base.logger = nil
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

