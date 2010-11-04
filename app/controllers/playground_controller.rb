class PlaygroundController < ApplicationController

  before_filter :set_game
  after_filter :set_session

  def index
  end

  def move
    if @game.finished?
      @game.restart
    else
      x = params[:x].to_i
      y = params[:y].to_i

      @game.move(x,y)
    end
    redirect_to :action => "index"
  end

  def restart
    @game.restart
    @find_number.restart
    redirect_to :action => "index"
  end

  def greater
    @find_number.greater
    redirect_to :action => "index"
  end

  def smaler
    @find_number.smaler
    redirect_to :action => "index"
  end

  private

  def set_game
    @find_number = Playground.new(session[:status])
    @game = TicTacToe.new(session[:board])
  end

  def set_session
    session[:status] = @find_number.status
    session[:board] = @game.board
  end

end