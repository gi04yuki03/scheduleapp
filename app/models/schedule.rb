class Schedule < ApplicationRecord
  
  validates :title, :start, :end, 
   presence: true
   
   
  validate :date_before_start
  validate :start_end_check
   
  def date_before_start
    errors.add(:start, "は今日以降のものを選択してください") if start < Date.today
  end
  
  def start_end_check
    errors.add(:end, "は開始日より前の日付は登録できません") unless
    self.start < self.end 
  end


 
end
