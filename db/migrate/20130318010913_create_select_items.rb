class CreateSelectItems < ActiveRecord::Migration
  def change
    create_table :select_items do |t|
      t.string :title
      t.references :judge, index: true

      t.timestamps
    end
  end
end
