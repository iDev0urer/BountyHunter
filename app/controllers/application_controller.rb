class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def get_browser(user_agent)
    user_agent.downcase!
    @users_browser ||= begin
      if user_agent.index('msie') && !user_agent.index('opera') && !user_agent.index('webtv')
        'ie'+user_agent[user_agent.index('msie')+5].chr
      elsif user_agent.index('airmail')
        'AirMail'
      elsif user_agent.index('gecko/')
        'gecko'
      elsif user_agent.index('opera')
        'opera'
      elsif user_agent.index('konqueror')
        'konqueror'
      elsif user_agent.index('ipod')
        'ipod'
      elsif user_agent.index('ipad')
        'ipad'
      elsif user_agent.index('iphone')
        'iphone'
      elsif user_agent.index('chrome/')
        'chrome'
      elsif user_agent.index('applewebkit/')
        'safari'
      elsif user_agent.index('googlebot/')
        'googlebot'
      elsif user_agent.index('msnbot')
        'msnbot'
      elsif user_agent.index('yahoo! slurp')
        'yahoobot'
        #Everything thinks it's mozilla, so this goes last
      elsif user_agent.index('mozilla/')
        'gecko'
      else
        'unknown'
      end
    end

    return @users_browser
  end

end
