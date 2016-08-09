class CreateGeneralInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :general_infos do |t|
      t.text :data, :limit => 100000
      t.string :linkedin

      t.timestamps
    end
  end
end
