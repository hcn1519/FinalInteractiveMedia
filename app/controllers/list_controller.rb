class ListController < ApplicationController
  def index
    year = params[:year]
    month = params[:month]
    day = params[:day]
    @startTime = DateTime.strptime("#{month}-#{day}-#{year} 00:00:00.000","%m-%d-%Y %H:%M:%S").to_time
    @endTime = DateTime.strptime("#{month}-#{day}-#{year} 23:59:59.999","%m-%d-%Y %H:%M:%S").to_time
    puts @time
    @targetDate = @startTime
    @homes = Home.where(writeDate: @startTime...@endTime)

    puts @homes
    # @targetDate = Time.zone.today
    # @homes = nil
    # if @time != nil
    #     @targetDate = @time
    #     @homes = Home.where(writeDate: @targetDate.beginning_of_day...@targetDate.end_of_day)
    # else
    #     @homes = Home.where(writeDate: Time.zone.today.beginning_of_day...Time.zone.today.end_of_day)
    # end

    @isEmpty = false
    if @homes.count == 0
      @isEmpty = true
    end

  end
  def search
  end
end
