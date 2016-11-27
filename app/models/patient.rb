class Patient < ActiveRecord::Base
  has_many :patient_visits, :dependent => :destroy
end
