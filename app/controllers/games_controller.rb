require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.shuffle.first(10)
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    user_serialized = open(url).read
    @user = JSON.parse(user_serialized)
    grid = JSON.parse(params[:grid])
    valid = params['word'].upcase.chars.all? { |letter| params['word'].upcase.count(letter) <= grid.count(letter) }
    if valid
      if @user["found"]
        @result = "english word"
      else
        @result = "wrong"
      end
    end

  end
end


# guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
