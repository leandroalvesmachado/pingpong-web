class CreateEstados < ActiveRecord::Migration[8.1]
  def change
    create_table :estados do |t|
      t.string :nome, null: false
      t.string :sigla, null: false
      t.boolean :ativo, null: false, default: true
      t.bigint :pais_id, null: false
      t.bigint :created_by, null: false
      t.bigint :updated_by, null: false
      t.bigint :deleted_by, null: true

      t.timestamps
      t.datetime :deleted_at
    end

    add_index :estados, [ :sigla, :pais_id ], unique: true
    add_index :estados, :deleted_at
    add_foreign_key :estados, :paises, column: :pais_id, primary_key: :id
    add_foreign_key :estados, :usuarios, column: :created_by, primary_key: :id
    add_foreign_key :estados, :usuarios, column: :updated_by, primary_key: :id
    add_foreign_key :estados, :usuarios, column: :deleted_by, primary_key: :id
  end
end
