class IncomingController < ApplicationController
  def index
    head :ok
  end

  def create
    message = JSON.parse(params[:mailinMsg])
    ForwardEmailJob.perform_later(message)
    head :ok
  end 
end
