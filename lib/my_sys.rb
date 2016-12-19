#coding:utf-8
require "will_paginate"
# wyl
# 扩展类方法
module MySys
  def self.included(base)
    base.extend ClassMethods
  end

  # 为对象扩展方法,为model添加转换为hash的方法
  def to_hash
    hash = {}
    self.attributes.each { |k,v| hash[k] = self.send(k)}
    return hash
  end

  # 定义类方法
  module ClassMethods
    # datatable分页，返回本页记录
    def search_paginate(args)
      conditions_sql = get_conditions(args[:search_content])#条件 sql字符串
      page = (args[:iDisplayStart]/(args[:per_page]*1.0)+1).floor
      args[:per_page] = 10 if args[:per_page].blank?
      result = self.where(conditions_sql).paginate(:page => page, :per_page => args[:per_page]).order(args[:order])
      result
    end

    # 统计符合条件记录的总记录数，用于datatable显示总共多少条记录
    def total_record(args)
      conditions_sql = get_conditions(args[:search_content])#条件 sql字符串
      total = self.where(conditions_sql).size #总纪录
    end

    # 获取检索条件
    def get_conditions(search_content)
      if search_content.blank?
        "1=1"
      else
        conditions=[]
        attr_with_type_hash = self.columns_hash
        attr_with_type_hash.each_pair do |attr,value|
          case value.type
            when "string", "text"
              conditions << self.send(:sanitize_sql, ["#{attr} LIKE ?", "%#{search_content}%"])
            when "datetime", "date"
              begin
                search_content2 = search_content.to_date
                if search_content2.year>1000
                  conditions << self.send(:sanitize_sql, ["#{attr}::date = ?", "#{search_content2}"])
                end
              rescue
                p '输入时间类型的搜索内容格式有问题'
              end
            when "integer", "float"
              if search_content.length == search_content.to_i.to_s.length
                conditions << self.send(:sanitize_sql, ["#{attr} = ?", "%#{search_content.to_f}%"])
              end
            when "boolean"
              if search_content == "true" && search_content == "false"
                conditions << self.send(:sanitize_sql, ["#{attr} = ?", "%#{search_content}%"])
              end
          end
        end
        conditions = conditions.any? ? conditions.collect { |c| "(#{c})" }.join(' or ') : nil
      end
    end
  end
end

ActiveRecord::Base.send :include, MySys