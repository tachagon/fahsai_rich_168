class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
  	conditions = warden_conditions.dup
  	if login = conditions.delete(:login)
  		where(conditions.to_hash).where([
  			"lower(member_code) = :value OR lower(email) = :value",
  			{ :value => login.downcase }
  		]).first
  	elsif conditions.has_key?(:member_code) || conditions.has_key?(:email)
  		where(conditions.to_hash).first
  	end
	end

  belongs_to :district
  belongs_to :amphur
  belongs_to :province
  belongs_to :zipcode
  belongs_to :role

end
