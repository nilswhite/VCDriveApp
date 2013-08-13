class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable,
         :rememberable, :trackable, :validatable
  # attr_accessible :title, :body

  #validates :name, presence: true
  
  # OMR says that this must be added to the user model, but it appears that it is conflicting with a built in checker in Devise (according to the google machine)
  #validates_presence_of :name

	# Set up accessible (or protected) attributes for your model 
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me, :provider, :uid, :as => [:default, :admin]

  has_many :pins, :dependent => :destroy
end
