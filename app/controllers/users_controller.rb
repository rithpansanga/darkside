class UsersController < ApplicationController




def edit

@user = User.find(params[:id])

end

def update

@user = User.find(params[:id])

if @user.update(user_params)

flash[:success] = "Your account was updated successfully"

redirect_to darkside_path

else

render 'edit'

end

end



def new

@user = User.new

end

def create

@user = User.new(user_params)

if @user.save

flash[:success] = "Welcome to the alpha blog #{@user.username}"

redirect_to darkside_path

else

render 'new'

end

end

private

def user_params

params.require(:user).permit(:username, :email, :password)

end





def show

end






end
