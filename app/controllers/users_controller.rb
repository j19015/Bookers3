class UsersController < ApplicationController
  def edit
    @user=User.find_by(id: params[:id])
    if @user.id!=current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def show
    @user=User.find_by(id: params[:id])
    @book=@user.books.new
  end
  
  def index
    @book=Book.new
    @user=User.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end