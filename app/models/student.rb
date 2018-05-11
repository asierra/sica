class Student < ApplicationRecord
  has_many :student_courses, :dependent => :delete_all #, dependent: :destroy
  has_many :student_academics, :dependent => :delete_all #, dependent: :destroy
  has_many :student_entries, :dependent => :delete_all #, dependent: :destroy
  has_one :scholarship
  belongs_to :nationality
 
  STATUS = ['inactivo', 'activo'].freeze

  validates_presence_of :name
  validates_presence_of :surname_paternal
  # validates_presence_of :surname_maternal # Algunos extranjeros no lo usan
  validates_presence_of :account
  validates_presence_of :email
  validates_presence_of :institution
  validates_presence_of :contact_name
  validates_presence_of :contact_tel
  validates_presence_of :filephoto, on: :create

  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  validates :account, uniqueness: true, numericality: true

  validates :contact_tel, format: { with: /\A[0-9\- ]+\z/i, on: :create }

  validates :has_course_or_activity, presence: { message: 'Debe tener un curso o una actividad.' }, on: :create

#  validates_format_of :filephoto, :content_type,
#                      :with => %r{\.(jpg|jpeg)\z}i, 
#                      :message => 'debe ser .jpg .jpeg'

#  validates_attachment :filephoto, :content_type =>  { :content_type => "image/jpg" }
  
  before_update :fix_account
  before_save :default_values
  
  def filephoto
    @filephoto
  end

  def filephoto=(val)
    @filephoto = val
    self.photo = @filephoto.read
  end

  def full_name
    [self.name, self.surname_paternal, self.surname_maternal].join(' ')
  end

  def has_course_or_activity=(val)
    @has_course_or_activity= val
  end
  
  def has_course_or_activity
    @has_course_or_activity
  end
  
  private

  def default_values
    self.status ||= 0
    self.scholarship_id ||= 1
  end

  def fix_account
    if self.account.present? and self.account.length > 9
      self.account = self.account[0..8]
    end
  end
end
