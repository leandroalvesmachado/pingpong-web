class Usuario < ApplicationRecord
  self.table_name = "usuarios"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :perfis, class_name: "UsuarioPerfil", foreign_key: "usuario_id", dependent: :destroy

  default_scope { includes(:perfis) }
end
