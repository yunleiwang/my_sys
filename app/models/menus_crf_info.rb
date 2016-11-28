class MenusCrfInfo < ActiveRecord::Base
  belongs_to :crf_info
  belongs_to :menu
end
