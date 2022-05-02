class Api::V1::LivrosController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def index
    @livros = policy_scope(Livro)
  end

  def show
    @livro = Livro.find(params[:id])
    authorize @livro
  end

  def create
    @livro = Livro.new(livros_params)
    @livro.user = current_user
    authorize @livro
    if @livro.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def livros_params
    params.require(:livro).permit(:título, :autor, :gênero, :lido, :nota, :review)
  end

  def render_error
    render json: { errors: @livro.errors.full_messages },
      status: :unprocessable_entity
  end
end
