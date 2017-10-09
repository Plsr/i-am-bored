class CreateMediaResources < ActiveRecord::Migration[5.0]
  def change
    create_table :media_resources do |t|
      t.string :name
      t.string :url
      t.string :description
      t.boolean :unconsumed
      t.string :fields, array: true
      t.timestamps
    end
  end
end
