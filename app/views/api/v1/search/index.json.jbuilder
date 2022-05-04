json.array! @livros do |livro|
  json.extract! livro, :id, :título, :autor, :gênero
end
