class StudentEntry < ApplicationRecord
  belongs_to :student

  def self.to_csv
    attributes = %w{Estudiante Cuenta Entrada}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      
      all.each do |student|
        csv <<  [ student.student.full_name, student.student.account, student.entry.to_s ]
      end
    end
  end
  
end
