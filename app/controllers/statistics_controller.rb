class StatisticsController < ApplicationController
  # GET /statistics
  # GET /statistics.json
  def index
    @statistics = Statistic.all
    
    @tops = Airfield.find(
                              :all,  
                               :order => 'altitude DESC', 
                               :limit => 10)
    @altitudes=[]
    @names=[]
    @tops.each do |top|
      @altitudes<<top.altitude
      @names<<top.name
    end
    
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:chart][:defaultSeriesType] = "column"
      f.options[:title][:text] = "10 Highest Located Airports"
      f.series(:name=>"Altitude in feet", :data=> @altitudes)
      f.options[:xAxis][:categories]=@names
    end
    
    @countries = Airfield.find(:all,
                              :select => "country, COUNT(name) as airport_sum",
                              :group => "country",
                              :order => 'airport_sum DESC',
                              :limit => 10)
    country=[]
    sum= []
    @countries.each do |c|
      country << c.country
      sum << c.airport_sum
    end
    
    @myhash = {}
    country.zip(sum) {|a,b| @myhash[a] = b }
    @myarray = @myhash.to_a
    
    
    @chart2 = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
      series = {
               :type=> 'pie',
               :name=> 'Number of airports',
               :data=> @myarray
      }
      f.series(series)
      f.options[:title][:text] = "Top Ten countries with most airports"
      f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
          :color=>"black",
          :style=>{
            :font=>"13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
    end
    
    @northern = Airfield.find(
                              :all,  
                               :order => 'latitude DESC', 
                               :limit => 10)
    @southern = Airfield.find(
                              :all,  
                               :order => 'latitude ASC', 
                               :limit => 10)
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statistics }
    end
  end
end
