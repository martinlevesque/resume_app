class CreateEducation < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|

      t.date :period_begin
      t.date :period_end
      t.string :title
      t.string :description

    end
  end
end
