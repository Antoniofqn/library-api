class CreateLivros < ActiveRecord::Migration[6.1]
  def change
    create_table :livros do |t|
      t.string :título
      t.string :autor
      t.string :gênero
      t.boolean :lido
      t.integer :nota
      t.string :review
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
