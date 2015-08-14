class TrackerController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :create

  include CarrierWave::RMagick

  def index
  end

  def show

    eid = params[:eid] ? params[:eid] : nil
    @tracker = update_tracker!(eid) if email_exists?(eid) unless eid.nil?
    render_image!

  end

  def render_image!
    response.headers['Content-Type'] = 'image/jpeg'
    response.headers['Content-Disposition'] = 'inline'

    img = Magick::Image.new(1,1) {
      self.background_color = "white"
    }
    img.format = 'jpeg'
    img.write('tracker.jpg')

    render text: img.to_blob, status: 200, content_type: 'image/jpeg'
  end

  private

  def email_exists?(eid)
    email = Email.where(eid: eid)
    email.length < 1 ? false : true
  end

  def update_tracker!(eid)
    email = Email.where(eid: eid).first
    tracker = email.tracker
    tracker.update!(
        views: (tracker.views += 1),
        ip_addr: request.remote_ip,
        user_agent: request.user_agent,
        browser: get_browser(request.user_agent),
        last_viewed: DateTime.now
    )
  end

end
