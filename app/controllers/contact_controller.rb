class ContactController < ApplicationController
  TARGETS = {
    "rickgrundy" => { email: "rick@rickgrundy.com", redirect: "http://rickgrundy.com" },
    "andygrundyarchitect" => { email: "rick@rickgrundy.com", redirect: "http://www.andygrundyarchitect.co.uk/contact_thanks.html" }
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
    
    puts body
    
    Pony.mail(:to => target[:email], :from => target[:email], :subject => "Website contact from #{name}", :body => body)
  end
end
