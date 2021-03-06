class Comment < ApplicationRecord
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  
  # Validations
  validates :body, presence: true
  validates :body, length: { maximum: 255 }
  
  def score
    res = 0
    self.votes.each do |a|
      res += a.weight
    end
    res
  end 
  
end