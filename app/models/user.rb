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

  after_initialize :set_default_role, if: :new_record?
  after_create :gen_member_code

  belongs_to :district
  belongs_to :amphur
  belongs_to :province
  belongs_to :zipcode
  belongs_to :role

  # ===================================================
  # validation
  # ===================================================

  VALID_IDEN_NUMBER_REGEX = /\A\d{13,13}\z/
  validates :iden_number,
            presence: true,
            length: {is: 13},
            format: {with: VALID_IDEN_NUMBER_REGEX},
            uniqueness: {case_sensitive: false}
  validate :iden_number_format

  validates :first_name,
            length: {maximum: 100},
            presence: true

  validates :last_name,
            length: {maximum: 100},
            presence: true

  validates :address,
            length: {maximum: 255},
            presence: true

  VALID_PHONE_NUMBER_REGEX = /\A0\d{8,}\z/
  validates :phone_number,
            format: {with: VALID_PHONE_NUMBER_REGEX},
            length: {in: 9..10},
            presence: true
  
  validates :birthday, presence: true

  validates :gender,
            inclusion: {in: %w(male female)},
            presence: true

  # ===================================================
  # class function
  # ===================================================

  def self.gen_iden_number
    iden_num = 12.times.map{Random.rand(1..8)}
    x = 0

    for i in 1..(iden_num.count)
      x += (14-i) * iden_num[i-1]
    end
    x = x%11
    n13 = -1
    if x <= 1
      n13 = 1 - x
    else
      n13 = 11 - x
    end
    iden_num << n13
    return iden_num.join
  end

  # ===================================================
  # public function
  # ===================================================

  def admin?
    self.role == Role.admin
  end

  def employee?
    self.role == Role.employee
  end

  def wholesaler?
    self.role == Role.wholesaler
  end

  def mobile?
    self.role == Role.mobile
  end
  
  def member?
    self.role == Role.member
  end

  # ===================================================
  # private function
  # ===================================================
  private

    def gen_member_code
      offset = 1000
      self.member_code = sprintf('%06d', self.id + offset)
      self.save
    end

    def set_default_role
      self.role = Role.member
    end

    def iden_number_format
      unless self.iden_number.blank?
        iden_number_i = self.iden_number.split(//).map(&:to_i)
        x = 0

        for i in 1..(iden_number_i.count-1)
          x += (14-i)*iden_number_i[i-1]
        end
        x = x%11

        if x <= 1
          unless iden_number_i[iden_number_i.count-1] == (1-x)
            errors.add(:iden_number, "รูปแบบไม่ถูกต้อง")
          end
        else
          unless iden_number_i[iden_number_i.count-1] == (11-x)
            errors.add(:iden_number, "รูปแบบไม่ถูกต้อง")
          end
        end
      end
    end

end
