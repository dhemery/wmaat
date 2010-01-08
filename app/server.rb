require 'rubygems'
require 'sinatra'
require 'haml'

$current_dirname = File.dirname(__FILE__)
$: << $current_dirname

require 'commands'

account_file_path = $current_dirname + "/../accounts/accounts.txt"
$commands = Commands.new(account_file_path)

get '/' do
    haml :index
end

get '/login' do
    @command = 'Log In'
    @action = '/login'
    haml :form
end

get '/create' do
    @command = 'Create Account'
    @action = '/create'
    haml :form
end

post '/login' do
    @command = 'Log In'
    @message = $commands.login(params[:username], params[:password])
    haml :status
end

post '/create' do
    @command = 'Create Account'
    @message = $commands.create(params[:username], params[:password])
    haml :status
end
