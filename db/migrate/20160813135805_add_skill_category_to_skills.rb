class AddSkillCategoryToSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :skill_category_id, :integer, default: nil
    add_index :skills, :skill_category_id
  end
end
