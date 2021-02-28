module OpinionsHelper
  # RETURNS A STRING WITH THE PASSED TIME SINCE POST
  def post_date_time(date_time)
    post_time = date_time
    current_time = DateTime.current
    if (current_time.to_date - post_time.to_date) < 1
      #SHOW HOURS
      minutes_since_post = (current_time.to_time - post_time.to_time).to_int / 60
      if minutes_since_post < 60
        return "#{minutes_since_post}m"
      else
        return "#{(minutes_since_post/60).to_int}h"
      end
    else
      #SHOW DAY-MONTH
      return post_time.strftime("%d %b")
    end
  end
end
