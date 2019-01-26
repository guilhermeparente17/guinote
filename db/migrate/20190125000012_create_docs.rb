class CreateDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :docs do |t|
      t.string :titulo
      t.text :conteudo

      t.timestamps
    end
  end
end
