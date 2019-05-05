class UsersController < Clearance::UsersController

  def show
    @user = User.find(params[:id])
    @songs = @user.songs
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
