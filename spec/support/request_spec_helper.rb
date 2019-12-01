module RequestSpecHelper
  def json
    JSON.parse(response.body, object_class: HashWithIndifferentAccess)
  end

  def token_generator(user_id)
    Auth::JsonWebToken.encode(user_id: user_id)
  end

  def expired_token_generator(user_id)
    Auth::JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  def valid_headers(user_id)
    {
      "Authorization" => token_generator(user_id),
      "Content-Type" => "application/json",
    }
  end

  def invalid_headers
    {
      "Authorization" => nil,
      "Content-Type" => "application/json"
    }
  end

  def valid_quote_params
    {
      author: "some author",
      access: 1,
      content: "quotable quotes"
    }
  end
end
