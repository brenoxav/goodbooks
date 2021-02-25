class FollowingsController < ApplicationController
  def create
    following = Following.new(following_params)
    #puts ">>>>>>#{following.inspect}<<<<<"
    if following.save
      redirect_to request.referrer, notice: "Following."
    else
      redirect_to request.referrer, alert: "Couldn't follow."
    end
  end

  def destroy
    following = Following.find_by(following_params)
    if following.destroy
      redirect_to request.referrer, notice: "Unfollowing."
    else
      redirect_to request.referrer, alert: "Couldn't unfollow.."
    end
  end

  def following_params
    params.require(:following).permit(:follower_id, :followed_id)
  end
end
