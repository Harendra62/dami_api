require 'jwt'
module JsonWebToken
    SECRET_KEY = 'o6czBbMD711yDtD8z2fhtmaHjd9IAAJtR0uBFOAGZmnT6duH_2ELPxwRpgQKvlhI'

    def jwt_encode(user_id)
        payload = {id: user_id, expiration: 7.days.from_now}
        JWT.encode(payload, SECRET_KEY)
    end

    def jwt_decode(token)
        JWT.decode(token,SECRET_KEY)[0]["id"]["user_id"]
    end
end