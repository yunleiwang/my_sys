class StatisticsController < ApplicationController
  layout 'item_form_metaelements'
  def index
    if params[:begin_date].blank?
      params[:begin_date] = Date.today.to_date - 7.days
    end

    if params[:end_date].blank?
      params[:end_date] = Date.today.to_date.to_date
    end
  end

  # 按月份统计
  def index2
    if params[:year].blank?
      params[:year] = Time.now.year
    end
  end

  # 按时间段统计
  def index_data
    legend = ["发病次数","1.丙戊酸钠","2.左乙拉西坦","3.拉莫三嗪","4.奥卡西平","5.卡马西平","6.托吡酯","7.氯硝西泮","8.苯巴比妥","9.苯妥英钠","10.加巴喷丁","11.扑痫酮","12.唑尼沙胺","13其他"]
    xAxis_data = []
    series = []
    patient_id = params[:patient_id]
    if params[:begin_date].blank?
      begin_date = Date.today.to_date - 7.days
    else
      begin_date = params[:begin_date].to_date
    end

    if params[:end_date].blank?
      end_date = Date.today.to_date.to_date
    else
      end_date = params[:end_date].to_date
    end

    if begin_date.blank? && end_date.blank?
      begin_date = Date.today
      end_date = Date.tomorrow
    end

    xAxis_data = (begin_date..end_date).to_a # 横坐标

    legend.each_with_index do |leg, index|
      data = []
      if index == 0  # 发病次数统计
        (begin_date..end_date).each do |date|
          count = Observe.where('observe_date = ? and patient_id=? and attack=1', date, patient_id).count
          data << count
        end
        series << {:name=>leg, :type=>'line', :data=>data}
      else # 各个药物使用统计
        (begin_date..end_date).each do |date|
          count = Observe.where('observe_date = ? and patient_id=? and drug=?', date, patient_id,leg).count
          if count>0
            count=10
          end
          data << count
        end
        series << {:name=>leg, :type=>'bar', :data=>data}
      end


    end
    data = {
        :legend => legend,
        :xAxis_data => xAxis_data,
        :series => series
    }
    render :json=>data
  end

  # 按月份统计
  def index2_data
    year = params[:year]
    if year.blank?
      year = Time.now.year
    end
    patient_id = params[:patient_id].to_i
    data = []
    series = []
    (1..12).to_a.each do |i|
      begin_date = Date.new(year.to_i,i,1)
      end_date = begin_date.next_month
      count = Observe.where('observe_date between ? and ? and patient_id=? and attack=1', begin_date, end_date, patient_id).count
      data << count
    end

    series << {:name=>"发病次数", :type=>'line', :data => data}
    data = {
        :series => series
    }
    render :json=>data
  end


  def by_month
    # start = params[:start].to_date
    # end_date = params[:end].to_date
    # patient_id = params[:patient_id]
    # result = []
    # (start...end_date).each do |date|
    #   count = Observe.where('observe_date = ? and patient_id=? and attack=1', date, patient_id).count
    #   result<<{:id=>1,:title=>count,:start=>date}
    # end
    # render :json=>result.to_json
  end

  # def by_month_data
  #   result = []
  #   if !params[:start].blank?
  #     start = Time.at(params[:start].to_i).to_date
  #     end_date = Time.at(params[:end].to_i).to_date
  #     patient_id = params[:patient_id]
  #     (start...end_date).to_a.each do |date|
  #       count = Observe.where('observe_date = ? and patient_id=? and attack=1', date, patient_id).count
  #       result<<{:title=>count.to_s+'次',:start=>date}
  #     end
  #   end
  #   render :json=>result
  # end

  def by_month_data
      result = []
      data = []
      item = []
      series = []
      if !params[:date].blank?
        begin_date = params[:date].to_date
        end_date = begin_date.end_of_month
        patient_id = params[:patient_id]

        (begin_date..end_date).to_a.each do |date|
          count = Observe.where('observe_date = ? and patient_id=? and attack=1', date, patient_id).count
          item << date
          data << count
        end
      end
      series << {:name=>"发病次数", :type=>'bar', :data => data,   itemStyle: {
          normal: {
              label: {
                  show: true,
                  textStyle: {
                      color: '#800080'
                  }
              }
          }
      },}
      json = {:item=>item, :series=>series}
      render :json=>json
  end

  def by_day

  end

  def by_hour

  end

  def by_hour_json
    date = params[:date]
    patient_id = params[:patient_id]
    series = []
    item = []
    observes = Observe.where('observe_date=? and patient_id=? and attack=1',date, patient_id)
    data = []
    eat_drug = []
    (1..24).each do |hour|
      hour_observes = observes.where(:observe_hour => hour)
      observe_count = hour_observes.count
      drugs_arr = hour_observes.collect{|ho|ho.drug}.compact.select{|bb|!bb.include?('0.无')}

      if drugs_arr.length>0
        eat_drug<< true
      else
        eat_drug<< false
      end
      data << observe_count
      item << hour.to_s+'时'
    end


    series << {:name=>"发病次数", :type=>'bar', :data => data,   itemStyle: {
        normal: {
            label: {
                show: true,
                textStyle: {
                    color: '#800080'
                }
            }
        }
    },}
    json = {:item=>item, :series=>series,:eat_drug=>eat_drug}
    render :json=>json
  end

end
