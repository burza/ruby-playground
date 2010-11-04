RubyPlayground::Application.routes.draw do

  match "tictactoe" => 'playground#index'
  match "tictactoe/restart" => 'playground#restart'
  match "tictactoe/move/:x/:y" => 'playground#move', :constraints => {:x => /\d/, :y => /\d/}, :as => "tictactoe/move"
  match "tictactoe/greater" => 'playground#greater'
  match "tictactoe/smaler" => 'playground#smaler'

  root :to => "playground#index"

end
