#coding:utf-8
class Patient < ActiveRecord::Base
  has_many :patient_visits, :dependent => :destroy
  # EASY="简易档案"
  # DETAIL="详细档案"
  EASY = 1
  DETAIL = 2

  EASY_ZH = "简易档案"
  DETAIL_ZH = "详细档案"
  # 获得患者档案的状态：简易档案和详细档案
  def get_file_type
    str = ""
    if self.file_type == 1
      str = "简易档案"
    elsif self.file_type == 2
      str = "详细档案"
    end

    str
  end
end
