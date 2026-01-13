class Usuario < ApplicationRecord
  self.table_name = "usuarios"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :usuarios_perfis,
           class_name: "UsuarioPerfil",
           foreign_key: "usuario_id",
           dependent: :destroy

  has_many :perfis,
           through: :usuarios_perfis,
           source: :perfil

  default_scope { includes(:usuarios_perfis) }

  def admin?
    perfis.exists?(codigo: Perfil::ADMIN)
  end

  def atleta?
    perfis.exists?(codigo: Perfil::ATLETA)
  end

  def clube?
    perfis.exists?(codigo: Perfil::CLUBE)
  end
end
