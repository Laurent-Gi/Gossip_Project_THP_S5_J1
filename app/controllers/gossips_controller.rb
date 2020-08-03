class GossipsController < ApplicationController

  def home
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
  end

end
