class WebhooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_user!
    def getrequest
        # I should save them to db maybe
        # all params[:]
       
        api = TestApi.new(request_id: params[:request_id],name: params[:name], email_address: params[:email_address])

        if api.save
            render json: {request_id: params[:request_id],name: params[:name], email_address: params[:email_address]}
        end
    end

    def getallapis
        @apis = TestApi.all
    end
end
