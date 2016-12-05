class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.references :article
      t.references :commenter

      t.timestamps(null: false)
    end
  end
end
