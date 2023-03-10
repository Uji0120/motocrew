class User::SessionsController < Devise::SessionsController
  
  #def guest_sign_in
    #user = User.guest
    #sign_in user
    #redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  #end
  
  private
  
  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user
    if @user.vaild_password?(params[:user][:password]) && (@user.is_deleted)
      redirect_to new_user_session_path
    end
  end
  
end