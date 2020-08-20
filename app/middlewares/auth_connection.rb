# class AuthConnection
#   def initialize app
#     @app = app
#   end

#   def call env
#     status, headers, body = @app.call(env)
#     socket_id = Rack::Request.new(env).params["socketId"]
#     if socket_id
#       # using this to create a unique connection in application_cable/connection.rb
#       Rack::Utils.set_cookie_header!(
#         headers,
#         "current_connection_token",
#         {:value => socket_id}
#       )
#     end
#     [status, headers, body]
#   end
# end
