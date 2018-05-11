class Academic < ApplicationRecord
  has_many :student_academics, :dependent => :delete_all
end
