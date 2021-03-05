module ApplicationHelper
  def follow_btn(followed_user)
    if current_user == followed_user
      nil
    elsif current_user.follower_of?(followed_user)
      button_to '-', following_path(current_user.id), method: :delete,
                                                      params: { following: {
                                                        follower_id: current_user.id,
                                                        followed_id: followed_user.id
                                                      } },
                                                      class: 'unfollow-btn'
    else
      button_to '+', followings_path,
                params: { following: {
                  follower_id: current_user.id,
                  followed_id: followed_user.id
                } },
                class: 'follow-btn'
    end
  end

  def nav_panel
    render 'layouts/nav_panel' if current_user
  end

  def nav_bar_icons
    render 'layouts/nav_bar_icons' if current_user
  end

  def notice_and_alert
    if notice
      render 'layouts/notice'
    elsif alert
      render 'layouts/alert'
    end
  end
end
