class RootController < ApplicationController
  def show
    Log.create(remote_ip: request.remote_ip, useragent: request.user_agent)
    
    redirect_to "/poster.png"
  end
end
