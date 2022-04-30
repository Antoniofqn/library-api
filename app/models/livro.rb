class Livro < ApplicationRecord
  belongs_to :user
  validates :título, :autor, :gênero, :nota, :review, presence: true
  validates :lido, exclusion: [nil]
  validates :nota, numericality: { in: 0..5, only_integer: true }
end
