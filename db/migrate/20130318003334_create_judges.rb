class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.string :title
      t.integer :select_type
      t.integer :judge_type
      t.datetime :judge_time
      t.datetime :remove_time

      t.timestamps
    end
  end
end
