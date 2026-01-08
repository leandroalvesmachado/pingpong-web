class CreatePerfis < ActiveRecord::Migration[8.1]
  def change
    create_table :perfis do |t|
      t.integer :codigo, null: false
      t.string :nome, null: false
      t.text :descricao, null: false
      t.boolean :ativo, null: false, default: true
      t.bigint :created_by, null: false
      t.bigint :updated_by, null: false
      t.bigint :deleted_by, null: true
      
      t.timestamps
      t.datetime :deleted_at
    end

    add_index :perfis, :codigo, unique: true
    add_index :perfis, :deleted_at
    add_foreign_key :perfis, :usuarios, column: :created_by, primary_key: :id
    add_foreign_key :perfis, :usuarios, column: :updated_by, primary_key: :id
    add_foreign_key :perfis, :usuarios, column: :deleted_by, primary_key: :id
  end
end
