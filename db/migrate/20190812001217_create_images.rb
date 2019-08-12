class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images, id: :uuid, default: 'uuid_generate_v4()', force: true do |t|
      t.attachment :img
      t.string :remote_url

      t.timestamps
    end
  end
end
