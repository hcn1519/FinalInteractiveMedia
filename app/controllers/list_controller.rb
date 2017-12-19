class ListController < ApplicationController
  def index
    year = params[:year]
    month = params[:month]
    day = params[:day]
    @time = nil
    if year != nil && month != nil && day != nil && year != "" && month != "" && day != ""

      date = DateTime.strptime("#{month}-#{day}-#{year}","%m-%d-%Y").to_time
      puts date
      # @time = Time.parse(date)

      @time = DateTime.strptime("#{month}-#{day}-#{year}","%m-%d-%Y").to_time
    end

    @targetDate = Time.zone.today
    @homes = nil
    if @time != nil
        @targetDate = @time
        @homes = Home.where(writeDate: @targetDate.beginning_of_day...@targetDate.end_of_day)
    else
        @homes = Home.where(writeDate: Time.zone.today.beginning_of_day...Time.zone.today.end_of_day)
    end

    @isEmpty = false
    if @homes.count == 0
      @isEmpty = true
    end

  end
  def search
  end
end
