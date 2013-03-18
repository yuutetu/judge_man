class CreateSubmits < ActiveRecord::Migration
  def change
    create_table :submits do |t|
      t.references :select_item, index: true
      t.references :judge, index: true

      t.timestamps
    end
  end
end
