class StudentEntry < ApplicationRecord
  belongs_to :student

  def self.to_csv
    attributes = %w{Fecha Nombre Procedencia Persona Asunto Cuenta Hora}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      students = self.where(created_at: (Time.now.midnight - 1.week)..Time.now.midnight)      
      students.each do |student|
        csv <<  [ student.entry.to_date.to_s, student.student.full_name,
                  student.student.institution, student.student.first_host,
                  student.student.first_course_or_activity,                
                  student.student.account, student.entry.to_s(:time) ]
      end
    end
  end
  
end
