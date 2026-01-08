class CreateMunicipios < ActiveRecord::Migration[8.1]
  def change
    create_table :municipios do |t|
      t.string :nome, null: false
      t.boolean :ativo, null: false, default: true
      t.bigint :estado_id, null: false
      t.bigint :created_by, null: false
      t.bigint :updated_by, null: false
      t.bigint :deleted_by, null: true

      t.timestamps
      t.datetime :deleted_at
    end

    add_index :municipios, :deleted_at
    add_foreign_key :municipios, :estados, column: :estado_id, primary_key: :id
    add_foreign_key :municipios, :usuarios, column: :created_by, primary_key: :id
    add_foreign_key :municipios, :usuarios, column: :updated_by, primary_key: :id
    add_foreign_key :municipios, :usuarios, column: :deleted_by, primary_key: :id
  end
end
