class UsersController < ApplicationController
  before_filter :authenticate_admin!, :only => [:destroy]
  
  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
 
    @reviews=@user.reviews
    @airfields=[]
    @reviews.each do |review|
      @airfields << review.airfield
    end
    @json = @airfields.to_gmaps4rails
    
   
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
