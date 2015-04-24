class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :audio,
  	:storage => :s3,
		:bucket => 'travelshopa-development',
		:s3_credentials => "#{Rails.root}/config/s3.yml"
	validates_attachment_content_type :audio, :content_type => /.*/
end
