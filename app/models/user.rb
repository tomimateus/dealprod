class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :client_attributes
  attr_accessor :new_password
   belongs_to :user_role
   has_one :company
   has_one :client

  attr_accessible :email, :password, :user_role_id, :company

  validates_presence_of :email, :password
  validates_confirmation_of :password, :on => :create

  accepts_nested_attributes_for :client, :allow_destroy => true

  def company?
    role_id = UserRole.where(:name => "CompanyUser").first().id
    self.user_role_id == role_id
  end


end
