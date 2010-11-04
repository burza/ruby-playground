module PlaygroundHelper

  def status_for_game_zone(board, x,y)
    unless board.nil?
      case board[x][y]
      when 0
        image_tag("tictactoe/icon_o.gif")
      when 1
        image_tag("tictactoe/icon_x.gif")
      else
        link_to "Move", tictactoe_move_path(:x => x, :y => y)
      end
    end
  end

end