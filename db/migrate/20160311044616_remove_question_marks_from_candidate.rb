class RemoveQuestionMarksFromCandidate < ActiveRecord::Migration
  def change
    rename_column :candidates, :local_candidate?, :local_candidate
    rename_column :candidates, :state_candidate?, :state_candidate
    rename_column :candidates, :national_candidate?, :national_candidate
    rename_column :candidates, :incumbent?, :incumbent
  end
end
