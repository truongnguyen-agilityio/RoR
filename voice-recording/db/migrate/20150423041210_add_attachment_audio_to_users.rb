class AddAttachmentAudioToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :users, :audio
  end
end
