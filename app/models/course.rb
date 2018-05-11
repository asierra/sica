class Course < ApplicationRecord
  belongs_to :academic
  has_many :student_courses, :dependent => :delete_all #, dependent: :destroy

  def full
    self.name+', '+self.course_day+' de '+self.course_time+', '+self.academic.name
  end

  before_save :default_values

  private

  def default_values
    self.semester ||= "2018-2"
  end
  
end
