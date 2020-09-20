class AdminController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:edit, :update]
  def index
    @users = User.all
  end

  def edit
    
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_index_path, notice: "Usuario Actualizado" }
      else
        format.html { redirect_to admin_index_path, notice: "Error al Actualizar el Usuario" }
      end
    end
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:admin)
  end
end
