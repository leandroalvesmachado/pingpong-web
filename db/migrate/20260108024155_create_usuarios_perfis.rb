class CreateUsuariosPerfis < ActiveRecord::Migration[8.1]
  def change
    create_table :usuarios_perfis do |t|
      t.bigint :usuario_id, null: false
      t.bigint :perfil_id, null: false
      t.bigint :created_by, null: false
      t.bigint :updated_by, null: false
      t.bigint :deleted_by, null: true

      t.timestamps
      t.datetime :deleted_at
    end

    add_index :usuarios_perfis, :deleted_at
    add_foreign_key :usuarios_perfis, :usuarios, column: :usuario_id, primary_key: :id
    add_foreign_key :usuarios_perfis, :perfis, column: :perfil_id, primary_key: :id
    add_foreign_key :usuarios_perfis, :usuarios, column: :created_by, primary_key: :id
    add_foreign_key :usuarios_perfis, :usuarios, column: :updated_by, primary_key: :id
    add_foreign_key :usuarios_perfis, :usuarios, column: :deleted_by, primary_key: :id
  end
end
