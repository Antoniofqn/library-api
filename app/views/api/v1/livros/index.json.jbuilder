json.array! @livros do |livro|
  json.extract! livro, :id, :título, :autor, :gênero, :lido, :nota, :review, :user_id
end
