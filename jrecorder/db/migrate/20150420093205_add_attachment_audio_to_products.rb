class AddAttachmentAudioToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :products, :audio
  end
end
