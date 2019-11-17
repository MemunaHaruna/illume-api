module Auth
  class AuthenticateUser
    def initialize(user_id)
      @user_id = user_id
    end

    def call
      Auth::JsonWebToken.encode(user_id: @user_id) if @user_id
    end
  end
end
