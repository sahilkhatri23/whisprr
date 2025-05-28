class CreateConfessions < ActiveRecord::Migration[7.1]
  def change
    create_table :confessions do |t|
      t.text :body
      t.string :ip

      t.timestamps
    end
  end
end
