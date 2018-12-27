class ContactController < ApplicationController
  RECAPTCHA_THRESHOLD = 0.5  # 0.0 = definitely a bot, 1.0 = definitely human

  TARGETS = {
    "rickgrundy" => { email: "rick@rickgrundy.com", redirect: "http://rickgrundy.com" },
    "andygrundyarchitect" => { email: "andy@andygrundyarchitect.co.uk", redirect: "http://www.andygrundyarchitect.co.uk/contact_thanks.html" }
  }
  
  def send_email
    unless confirm_recaptcha(params[:recaptcha])
      return render status: 401, text: "Unauthorised request. Please contact us by phone instead."
    end

    target = TARGETS[params[:target]] || raise("No target defined for #{params[:target]}")
    name = params[:name].present? ? params[:name] : "Unknown Person"
    
    body = "
      #{name} has contacted you via your website.
      
      Their email address: #{params[:email].present? ? params[:email] : "Unknown"}
      
      Their phone number: #{params[:phone].present? ? params[:phone] : "Unknown"}
      
      Their message:
      
      #{params[:message]}
    "
    
    Pony.mail(:to => target[:email], :from => target[:email], :cc => "rick@rickgrundy.com", :subject => "Website contact from #{name}", :body => body)
    
    redirect_to target[:redirect]
  end

  private

  def confirm_recaptcha(token)
    uri = URI("https://www.google.com/recaptcha/api/siteverify?secret=#{ENV['RECAPTCHA_SECRET']}&response=#{token}")
    res = Net::HTTP.get(uri)

    Rails.logger.info("RECAPTCHA response: #{res}")

    data = JSON.parse(res)
    return data["success"] && data["score"] >= RECAPTCHA_THRESHOLD
  end
end