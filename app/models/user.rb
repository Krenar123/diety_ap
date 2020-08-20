class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PASSWORD = /\A      # Must contain 8 or more characters
      (?=.*\d)           # Must contain a digit
      (?=.*[A-Z])        # Must contain an upper case character
      (?=.*[[:^alnum:]]) # Must contain a symbol
  /x

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :downcase_email, :capitalize_name

  validates :password,
    format: {
      with: VALID_PASSWORD,
      message: 'must contain digit, upper case and symbol' }
  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }

  private

  def downcase_email
    self.email = email.downcase
  end

  def capitalize_name
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end
end
