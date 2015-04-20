class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :api_key, dependent: :destroy
  has_many :projects, dependent: :destroy

  after_create :create_api_key
  before_create :set_auth_token

  private
  	def create_api_key
  		ApiKey.create :user => self
  	end

    def set_auth_token
      return if auth_token.present?
      self.auth_token = generated_auth_token
    end
    def generated_auth_token
      SecureRandom.uuid.gsub(/\-/,'')
    end
end
