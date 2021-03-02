module ApplicationHelper
  def follow_btn(followed_user)
    if current_user.is_follower_of?(followed_user)
      #TODO Fix 'unfollow' button
      button_to "", {
        controller: :followings, action: :destroy, method: :delete,
        params: { following: { follower_id: current_user.id, followed_id:followed_user.id} } 
      },
      { class: 'unfollow-btn' }
    else
      button_to "", {
        controller: :followings, action: :create, method: :post,
        params: { following: { follower_id: current_user.id, followed_id:followed_user.id} } 
      },
      { class: 'follow-btn' }
    end
  end
end
