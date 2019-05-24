module TokenAuthSpecHelper
  def login_headers(email, password)
    post '/auth/sign_in', params: { email: email, password: password }

    headers = response.headers

    {
      'access-token': headers['access-token'],
      'client': headers['client'],
      'expiry': headers['expiry'],
      'uid': headers['uid'],
      'token-type': headers['token-type'],
    }
  end
end
