module Users
  class ValidateLogin 
    attr_accessor :user,
                  :errors
    def initialize(config:)
      @config = config

      @username = @config[:username]
      @password = @config[:password]
      @errors = {}
    end

    def execute!

      if @username.blank?
        @errors['username'] = 'Username required'
      end

      if @password.blank?
         @errors['password'] = 'Password required'
      end

        if @username.present? and @password.present?
          @user = User.find_by_email(@username)       
          if user.blank?
            @errors['username'] = 'User not found'
          elsif  !user.valid_password?(@password)
             @errors['password'] = 'Invalid password'
          end
        end
    end

  end
end