class Course < ApplicationRecord
  belongs_to :academic
  has_many :student_courses, :dependent => :delete_all #, dependent: :destroy

  def full
    self.name+', '+self.course_day+' de '+self.course_time+', '+self.academic.name
  end

  def self.to_csv
    attributes = %w{id name}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |course|
        csv << attributes.map{ |attr| course.send(attr) }
      end
    end
  end
  
  before_save :default_values

  private

  def default_values
    self.semester ||= "2018-2"
  end
  
end
