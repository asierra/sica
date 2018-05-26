class StudentEntry < ApplicationRecord
  belongs_to :student

  def self.to_csv
    attributes = %w{Estudiante Entrada}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      
      all.each do |student|
        csv <<  [ student.student.full_name, student.entry.to_s ]
#        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end
  
end
