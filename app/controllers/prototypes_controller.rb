class PrototypesController < ApplicationController
  before_action :authenticate_user!,  only: [:edit, :destroy, :new]

  def index
    if user_signed_in?
      @name = current_user.name
    else
      @prototypes = Prototype.includes(:user)
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @name = @prototype.user.name
    @comments = @prototype.comments.includes(:user)
    @comment = Comment.new
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.build(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user == current_user
      redirect_to root_path
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image ).merge(user_id: current_user.id)
  end

end