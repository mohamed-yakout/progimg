class CreateTransferredImages < ActiveRecord::Migration[5.2]
  def change
    create_table :transferred_images, id: :uuid, default: 'uuid_generate_v4()', force: true do |t|
      t.attachment :img
      t.string :format
      t.string :resize
      t.string :rotate
      t.string :colorspace
      t.references :image, type: :uuid, foreign_key: true, index: true

      t.timestamps
    end
  end
end
