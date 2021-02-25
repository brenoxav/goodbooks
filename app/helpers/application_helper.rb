module ApplicationHelper
  def follow_btn(followed_user)
    if current_user.is_follower_of?(followed_user)
      button_to 'Unfollow', following_path(followed_user), method: :delete,
      params: { following: { follower_id: current_user.id, followed_id:followed_user.id} }
    else
      button_to 'Follow', followings_path, method: :post,
      params: { following: { follower_id: current_user.id, followed_id:followed_user.id} }
    end
  end
end
