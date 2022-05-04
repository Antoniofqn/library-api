class Api::V1::SearchController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def index
    if params[:título].present?
      @livros = policy_scope(Livro).search(params[:título])
    elsif params[:autor].present?
      @livros = policy_scope(Livro).search(params[:autor])
    elsif params[:gênero].present?
      @livros = policy_scope(Livro).search(params[:gênero])
    else
      @livros = policy_scope(Livro)
    end
  end
end
