class AddAudioUrlToProducts < ActiveRecord::Migration
  def change
    add_column :products, :audio_url, :string
  end
end
