class CounterChannel < ApplicationCable::Channel
  def subscribed
    stream_from "counter"
    
    self.update
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update
    ActionCable.server.broadcast(
      "counter",
      Log.count,
    )
  end
end
