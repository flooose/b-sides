class CreateGittes < ActiveRecord::Migration[5.0]
  def change
    create_table :gittes do |t|
      t.string :reponame

      t.timestamps
    end
  end
end
