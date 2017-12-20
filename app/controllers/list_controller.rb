class ListController < ApplicationController
  def index
    year = params[:year]
    month = params[:month]
    day = params[:day]
    @startTime = DateTime.strptime("#{month}-#{day}-#{year} 00:00:00.000","%m-%d-%Y %H:%M:%S").to_time
    @endTime = DateTime.strptime("#{month}-#{day}-#{year} 23:59:59.999","%m-%d-%Y %H:%M:%S").to_time

    @targetDate = @startTime
    @homes = Home.where(writeDate: @startTime...@endTime)

    @isEmpty = false
    if @homes.count == 0
      @isEmpty = true
    end

  end
  def search
  end
end
