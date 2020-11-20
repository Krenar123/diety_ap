class WebhooksController < ApplicationController
    def getrequest
        # I should save them to db maybe
        # all params[:]
        req = params[:request_id]
        name = params[:name]

        render json: {request_id: req, name: name}
    end
end
