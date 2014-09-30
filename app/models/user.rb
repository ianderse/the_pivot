class User < ActiveRecord::Base
  has_secure_password


  validates :full_name, presence: true
  validates_format_of :email_address, :with => /.+@.+\..+/i
  validates :email_address, uniqueness: true

  # attr_accessible :name , :email

  # User::Roles
  # The available roles
  Roles = [ :admin , :user ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

end
