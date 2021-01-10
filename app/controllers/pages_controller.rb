class PagesController < ApplicationController
    skip_before_action :authenticate_user!
    
    def index
    end

    def contact
        @user = User.new
    end

    def contact_send_form
        if user_params.nil?
            render :contact
        else
            UserMailer.contact_email(user_params).deliver
            redirect_to root_path
        end
    end

    private

    def user_params 
        params.require(:user).permit(:first_name, :last_name, :email, :message, :state, :zip)
    end
end
