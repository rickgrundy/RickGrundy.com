class ContactController < ApplicationController
  TARGETS = {
    "rickgrundy" => { email: "rick@rickgrundy.com", redirect: "http://rickgrundy.com" },
    "andygrundyarchitect" => { email: "andy@andygrundyarchitect.co.uk", redirect: "http://www.andygrundyarchitect.co.uk/contact_thanks.html" }
  }
  
  def send_email
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
end
