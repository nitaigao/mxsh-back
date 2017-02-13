class RootController < ApplicationController
  def index
    render plain: 'Yes, i am alive'
  end
end
