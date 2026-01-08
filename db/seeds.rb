# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

begin
  ActiveRecord::Base.transaction do
    usuario = Usuario.find_or_create_by!(email: "leandroalvesmachado@gmail.com") do |usuario|
      usuario.nome = "Leandro Alves Machado"
      usuario.password = "P@ssword"
      usuario.password_confirmation = "P@ssword"
      usuario.confirmed_at = Time.current if usuario.respond_to?(:confirmed_at)
    end

    if usuario.present?
      perfis = [
        { codigo: 1, nome: 'Administrador', descricao: 'Perfil de acesso ao sistema como Administrador' },
        { codigo: 2, nome: 'Atleta', descricao: 'Perfil de acesso ao sistema como Atleta' },
        { codigo: 3, nome: 'Clube', descricao: 'Perfil de acesso ao sistema como Clube' },
      ]

      perfis.each do |perfil|
        Perfil.create!(
          codigo: perfil[:codigo],
          nome: perfil[:nome],
          descricao: perfil[:descricao],
          created_by: usuario.id,
          updated_by: usuario.id
        )
      end

      perfil_adm = Perfil.find_by!(codigo: 1)
      UsuarioPerfil.create!(
        usuario_id: usuario.id,
        perfil_id: perfil_adm.id,
        created_by: usuario.id,
        updated_by: usuario.id
      )
    end
  end
rescue => e
  puts "Erro ao executar seeds: #{e.message}"
end
