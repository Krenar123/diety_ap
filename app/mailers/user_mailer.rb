class UserMailer < ApplicationMailer
    default from: 'dietyapcontact@gmail.com'
  
    def contact_email(message)
        mail(to: 'dietyapcontact@gmail.com', subject: message)
    end
end
