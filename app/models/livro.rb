class Livro < ApplicationRecord
  belongs_to :user
  validates :título, :autor, :gênero, presence: true
  validates :lido, exclusion: [nil]
  validates :nota, numericality: { in: 0..5, only_integer: true }, presence: true, if: Proc.new { |livro| livro.lido? }
end
