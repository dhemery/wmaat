class Password
    MINIMUM_PASSWORD_LENGTH = 6
    MAXIMUM_PASSWORD_LENGTH = 16

    def initialize(password)
        @password = password
    end

    def contains_all_required_character_types?
        contains_letter? and contains_digit? and contains_punctuation?
    end

    def contains_digit?
        matches? /[[:digit:]]/
    end

    def contains_letter?
        matches? /[[:alpha:]]/
    end

    def contains_punctuation?
        matches? /[[:punct:]]/
    end

    def matches? pattern
        !(@password =~ pattern).nil?
    end

    def too_long?
        @password.length > MAXIMUM_PASSWORD_LENGTH
    end

    def too_short?
        @password.length < MINIMUM_PASSWORD_LENGTH
    end

    def valid?
        valid_length? and contains_all_required_character_types?
    end

    def valid_length?
        not (too_short? or too_long?)
    end
end
