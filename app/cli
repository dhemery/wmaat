#!/usr/bin/env ruby

$current_dirname = File.dirname(__FILE__)
$: << $current_dirname

require 'commands'

class CommandLineRunner
    def initialize account_file_path
        @commands = Commands.new account_file_path
    end

    def execute args
        return NoCommand if args.nil?
        command = parse_command args
        puts execute_command command, args
    end

    def execute_command command, args
        if @commands.respond_to? command
            response = @commands.send(command, args[1], args[2])
        else
            response = UnknownCommand + " #{command.to_s}"
        end
    end

    def parse_command args
        command = args[0].to_sym
    end
end

account_file_path = "#{$current_dirname}/../accounts/accounts.txt"
runner = CommandLineRunner.new account_file_path
runner.execute ARGV
