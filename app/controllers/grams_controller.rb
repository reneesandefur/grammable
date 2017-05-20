class GramsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
  end
  
  def new
  end
  
  def create
    @gram = current_user.grams.create(gram_params)
    if @gram.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @gram = Gram.find_by_id(params[:id])
    return not_found if @gram.blank? 
  end
  
  def edit 
    @gram = Gram.find_by_id(params[:id])
    return not_found if @gram.blank? 
  end
  
  def update
    @gram = Gram.find_by_id(params[:id])
    return not_found if @gram.blank?
    
    if @gram.update_attributes(gram_params)
      redirect_to root_path
    else
      return render :edit, status: :unprocessable_entity
    end
  end
  
  private
  
  def not_found
    render plain: 'Not found', status: :not_found
  end
  
  def gram_params
    params.require(:gram).permit(:message, :id)
  end
end
