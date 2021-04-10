class NumberController < ApplicationController
  def show
    @count = Log.count
  end
end
