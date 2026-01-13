class Perfil < ApplicationRecord
  self.table_name = "perfis"

  ADMIN = 1
  ATLETA = 2
  CLUBE = 3
end
