require_relative '../config/environment'

#initializing a new class obect instance from CLI.rb
ActiveRecord::Base.logger = nil
cli = CommandLineInterface.new
cli.greet