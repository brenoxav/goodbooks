module OpinionsHelper
  def post_date_time(date_time)
    post_time = date_time
    current_time = DateTime.current
    if (current_time.to_date - post_time.to_date) < 1
      minutes_since_post = (current_time.to_time - post_time.to_time).to_int / 60
      if minutes_since_post < 60
        "#{minutes_since_post}m"
      else
        "#{(minutes_since_post / 60).to_int}h"
      end
    else
      post_time.strftime('%d %b')
    end
  end
end
