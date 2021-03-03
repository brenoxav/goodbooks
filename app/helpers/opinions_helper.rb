module OpinionsHelper
  # Returns the time passes since post as string
  def post_date_time(date_time)
    post_time = date_time
    current_time = DateTime.current
    if (current_time.to_date - post_time.to_date) < 1
      # Show minutes or hours
      minutes_since_post = (current_time.to_time - post_time.to_time).to_int / 60
      if minutes_since_post < 60
        "#{minutes_since_post}m"
      else
        "#{(minutes_since_post / 60).to_int}h"
      end
    else
      # Show day-month
      post_time.strftime('%d %b')
    end
  end
end
