class RootController < ApplicationController
  def show
    remote_ip = if ENV['CDN_TOKEN'].present? && request.env['CDN_TOKEN'] == ENV['CDN_TOKEN']
      request.env['HTTP_X_FORWARDED_FOR']
    else
      request.remote_ip
    end
    Log.create(remote_ip: remote_ip, useragent: request.user_agent)

    ActionCable.server.broadcast(
      "counter",
      Log.count,
    )

    redirect_to "/poster.png"
  end
end
