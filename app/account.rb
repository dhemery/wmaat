class Account
    attr_accessor :user_name, :password, :status

    def initialize(user_name, password, status)
        @user_name = user_name
        @password = password
        @status = status
    end

    def logged_in?
        return @status == :online
    end

    def match? user_name, password
        return @user_name == user_name && @password == password
    end
end
