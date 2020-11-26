class WebhooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_user!
    def getrequest
        # I should save them to db maybe
        # all params[:]
       
        api = TestApi.new(request_id: params[:request_id],name: params[:name], email_address: params[:email_address], pdf_url: params[:pdf_url])

        if api.save
            render json: {request_id: params[:request_id],name: params[:name], email_address: params[:email_address], pdf_url: params[:pdf_url]}
        end
    end

    def getstatus
        api = StatusApi.new(request_id: params[:request_id], status: params[:status], name: params[:name], email: params[:email_address], profile_link: params[:profile_link])

        if api.save
            render json: {request_id: params[:request_id], status: params[:status], name: params[:name], email: params[:email_address], profile_link: params[:profile_link]}
        end
    end

    def getallapis
        @apis = TestApi.all.order("created_at DESC")
    end

    def getallstatuses
        @apis = StatusApi.all.order("created_at DESC")
    end
end
