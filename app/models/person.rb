class Person < ActiveRecord::Base
  BLOOD_GROUPS = %w(O+ O– A+ A– B+ B– AB+ AB–)

  validates :name, :email, :blood_group, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :phone, phony_plausible: true, allow_blank: true

  scope :approved, -> { where(approved: true) }
end
