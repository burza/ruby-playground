module TicTacToe

  attr_accessor :board

  def initialize(board = nil)
    if board.nil?
      @board = [ [nil,nil,nil], [nil,nil,nil], [nil,nil,nil] ]
    else
      @board = board
    end
  end

  def show

    res = @board.map do |value|
      mapper = {nil => " ", 0 => "o", 1 => "x"}
      value.map { |item| mapper[item] }
    end

    result = res.map do |value|
      value.join('|')
    end

    puts result.join "\n-----\n"

  end

  def move(x,y)

    if (0..2) === x and (0..2) === y

      messages = {
        nil => "Zug wurde ausgeführt",
        0 => "Zug konnte nicht ausgeführt werden, da dieses Feld schon belegt ist. Bitte versuchen Sie es noch einmal.",
        1 => "Zug konnte nicht ausgeführt werden, da dieses Feld schon belegt ist. Bitte versuchen Sie es noch einmal."
      }

      player = {
        nil => 0,
        0 => 0,
        1 => 1
      }

      if @board[x][y].nil?

        @board[x][y] = player[@board[x][y]]

        if finished?
          #puts "Sie haben gewonnen."
        else
          com_moves = []
          @board.each_with_index do |item, index|
            item.each_with_index do |value, times|
              if value.nil?
                com_moves << [index,times]
              end
            end
          end
          com_move = com_moves[rand(com_moves.size)]
          unless com_moves.blank?
            @board[com_move[0]][com_move[1]] = 1
          end
          #puts "Der Computer hat gewonnen." if finished()
        end
        #show()
      end
    end
  end

  def restart
    @board = @board.map { |item| item.map { |value| value = nil } }
  end

  def finished?
    3.times do |i|
      if @board[i][0] != nil and @board[i][0] == @board[i][1] and @board[i][0] == @board[i][2]
        return true
      elsif @board[0][i] != nil and @board[0][i] == @board[1][i] and @board[0][i] == @board[2][i]
        return true
      end
    end

    if @board[0][0] != nil and @board[0][0] == @board[1][1] and @board[1][1] == @board[2][2]
      return true
    elsif @board[0][2] != nil and @board[0][2] == @board[1][1] and @board[1][1] == @board[2][0]
      return true
    end
    false
  end

end
