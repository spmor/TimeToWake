class SayController < ApplicationController
  def hello
  	@time = Time.now
  	wakeTime = @time.change(day: Time.now.day + 1, hour: 6, min:50)
  	@minutesUntilEndOfDay = @time.hour > 0 && @time.hour < wakeTime.hour ? 0 : Time.now.seconds_until_end_of_day / 60  	
  	@hourDifference = (@minutesUntilEndOfDay + ((wakeTime.hour * 60) + wakeTime.min)) / 60
  	@minDifference = (@minutesUntilEndOfDay + ((wakeTime.hour * 60) + wakeTime.min)) - @hourDifference * 60
  	@hourEight = (@minutesUntilEndOfDay + ((wakeTime.hour * 60) + wakeTime.min)) / 60
  	@count ||= 0;

  	if @hourDifference < 10
  		@hourDifference = "0" + @hourDifference.to_s
  	end
  	if @minDifference < 10
  		@minDifference = "0" + @minDifference.to_s
  	end

  end

  def goodbye
  end
end
