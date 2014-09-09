module ApplicationHelper

  def time_distance (datetime)

    ntime = DateTime.new(datetime.year, datetime.month, datetime.day, datetime.hour, datetime.min, datetime.sec, '-0300')
    nnow  = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day, DateTime.now.hour, DateTime.now.min, DateTime.now.sec, '-0300')

    time = Time.parse(ntime.to_s)
    time_now = Time.parse(nnow.to_s)

    if (time_now < time)
      diff_seconds = time - time_now
      diff_minutes = (diff_seconds / 60).round

      minutes_left = diff_minutes

      days = minutes_left / 1440

      minutes_left = minutes_left % 1440

      hours = minutes_left / 60

      minutes_left = minutes_left % 60

      minutes = minutes_left

      seconds_left =  (diff_seconds % 60).round

      seconds = seconds_left

    else
      days = 0
      hours = 0
      minutes = 0
      seconds = 0
    end

    #TODO: CHANGE THIS
    return {:days => days, :hours => hours, :minutes => minutes, :seconds => seconds}

  end


end
