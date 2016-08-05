class AddNbMonthsToExperienceSkill < ActiveRecord::Migration[5.0]
  def change
    add_column :experience_skills, :nb_months, :integer, :default => 0
  end
end
