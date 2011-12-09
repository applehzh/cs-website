module SessionsHelper
  
  def thirdparty_username(auth)
    p "==== #{auth}"
    p "==== #{auth[:provider]}"
    if ['github','twitter'].include?(auth[:provider]) 
      p "==== #{auth[:username]}"
      auth[:username]
    else
      p "==== #{auth[:email]}"
      auth[:email]
    end
  end
    
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id]
    self.current_user = user
  end
  
  def sign_out
    current_user.destroy unless current_user.nil?
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil]
    end
  
end
