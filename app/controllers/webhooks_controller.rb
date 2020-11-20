class WebhooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_user!
    def getrequest
        # I should save them to db maybe
        # all params[:]
        if params[:request_id].present?
            @req = params[:request_id]
        end

        render json: {request_id: @req, name: params[:name]}
    end
end
