class SearchController < ApplicationController

  def index
    @properties = Property.all.order(created_at: :desc)
  end

  def tinder
    @properties = Property.all.order(created_at: :desc)
  end


end
