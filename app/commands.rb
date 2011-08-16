require 'account'
require 'account_file'
require 'messages'
require 'password'

class Commands
    include Messages

    def initialize(account_file_path)
        account_dir = File.dirname(account_file_path)
        Dir.mkdir account_dir unless Dir.exists? account_dir
        @account_file = AccountFile.new account_file_path
        @accounts = @account_file.load
    end

    def create(user_name, password, status=:active)
        return InvalidPassword unless Password.new(password).valid?
        account = Account.new(user_name, password, status)
        @accounts[user_name] = account
        @account_file.save @accounts
        return AccountCreated
    end

    def login(user_name, password)
        account = @accounts[user_name]
        return AccessDenied if account.nil?
        if account.match?(user_name, password)
            account.status = :online
            @account_file.save @accounts
            return LoggedIn
        else
            return AccessDenied
        end
    end
end
