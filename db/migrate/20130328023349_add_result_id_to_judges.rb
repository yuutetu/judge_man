class AddResultIdToJudges < ActiveRecord::Migration
  def change
    add_column :judges, :result_id, :integer
  end
end
