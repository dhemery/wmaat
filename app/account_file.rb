class AccountFile
    def initialize account_file_path
        @account_file_path = account_file_path
    end

    def load
        accounts = {}
        if File.exists?(@account_file_path)
            account_file = File.open(@account_file_path)
            account_file.each_line do |line|
                fields = line.split("\t")
                account = Account.new fields[0], fields[1], fields[2].to_sym
                accounts[account.user_name] = account
            end
            account_file.close
        end
        return accounts
    end

    def save accounts
        account_file = File.open(@account_file_path, "w")
        accounts.each_value do |account|
            account_file.puts(account.user_name + "\t" + account.password  + "\t" +  account.status.to_s)
        end
        account_file.close
    end
end
