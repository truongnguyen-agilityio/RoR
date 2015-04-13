class User < ActiveRecord::Base
  has_attached_file :avatar,
  									:styles => { :medium => "300x300>", :thumb => "100x100>" },
  									:default_url => "/images/:style/missing.png",
  									:storage => :s3,
  									:bucket => 'travelshopa-development',
  									:s3_credentials => "#{Rails.root}/config/s3.yml"
  									# :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	validates :avatar, :attachment_presence => true
	validates_with AttachmentPresenceValidator, :attributes => :avatar
	validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 5.megabytes

	# def s3_credentials
 #    {:bucket => "travelshopa-development", :access_key_id => "AKIAJUKP7HUPC7R3DVPQ", :secret_access_key => "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"}
 #  end
end
