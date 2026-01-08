class UsuarioPerfil < ApplicationRecord
  self.table_name = "usuarios_perfis"

  belongs_to :usuario, class_name: "Usuario", foreign_key: "usuario_id"
  belongs_to :perfil, class_name: "Perfil", foreign_key: "perfil_id"
end
