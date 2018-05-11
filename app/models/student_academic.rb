class StudentAcademic < ApplicationRecord
  belongs_to :student
  belongs_to :academic
  belongs_to :activity

  def full
    self.activity.name+' con '+self.academic.name
  end
  
end
