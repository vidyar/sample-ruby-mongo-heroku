require 'mongoid'
Mongoid.load!('mongoid.yml', :production)

class Score
  include Mongoid::Document
  field :score, type: Integer
end

class Bowling
  @var = 0

  def hit(score)
    new_score = Score.new(score: score)
    new_score.save()
  end

  def score
    Score.first.score
  end
end

