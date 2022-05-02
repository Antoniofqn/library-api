class Api::V1::LivrosController < Api::V1::BaseController
  def index
    @livros = policy_scope(Livro)
  end

  def show
    @livro = Livro.find(params[:id])
    authorize @livro
  end
end
