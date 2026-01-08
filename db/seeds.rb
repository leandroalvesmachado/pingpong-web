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
        { codigo: 1, nome: "Administrador", descricao: "Perfil de acesso ao sistema como Administrador" },
        { codigo: 2, nome: "Atleta", descricao: "Perfil de acesso ao sistema como Atleta" },
        { codigo: 3, nome: "Clube", descricao: "Perfil de acesso ao sistema como Clube" }
      ]

      perfis.each do |perfil|
        Perfil.find_or_create_by!(
          codigo: perfil[:codigo],
          nome: perfil[:nome],
          descricao: perfil[:descricao],
          created_by: usuario.id,
          updated_by: usuario.id
        )
      end

      perfil_adm = Perfil.find_by!(codigo: 1)
      UsuarioPerfil.find_or_create_by!(
        usuario_id: usuario.id,
        perfil_id: perfil_adm.id,
        created_by: usuario.id,
        updated_by: usuario.id
      )

      pais = Pais.find_or_create_by!(sigla: "BRA") do |pais|
        pais.nome = "Brasil"
        pais.sigla = "BRA"
        pais.created_by = usuario.id
        pais.updated_by = usuario.id
      end

      estados = [
        { nome: "Acre", sigla: "AC" },
        { nome: "Alagoas", sigla: "AL" },
        { nome: "Amapá", sigla: "AP" },
        { nome: "Amazonas", sigla: "AM" },
        { nome: "Bahia", sigla: "BH" },
        { nome: "Ceará", sigla: "CE" },
        { nome: "Distrito Federal", sigla: "DF" },
        { nome: "Espírito Santo", sigla: "ES" },
        { nome: "Goiás", sigla: "GO" },
        { nome: "Maranhão", sigla: "MA" },
        { nome: "Mato Grosso", sigla: "MT" },
        { nome: "Mato Grosso do Sul", sigla: "MS" },
        { nome: "Minas Gerais", sigla: "MG" },
        { nome: "Pará", sigla: "PA" },
        { nome: "Paraíba", sigla: "PB" },
        { nome: "Paraná", sigla: "PR" },
        { nome: "Pernambuco", sigla: "PE" },
        { nome: "Piauí", sigla: "PI" },
        { nome: "Rio de Janeiro", sigla: "RJ" },
        { nome: "Rio Grande do Norte", sigla: "RN" },
        { nome: "Rio Grande do Sul", sigla: "RS" },
        { nome: "Rondônia", sigla: "RO" },
        { nome: "Roraima", sigla: "RR" },
        { nome: "Santa Catarina", sigla: "SC" },
        { nome: "São Paulo", sigla: "SP" },
        { nome: "Sergipe", sigla: "SE" },
        { nome: "Tocantins", sigla: "TO" }
      ]

      estados.each do |estado|
        Estado.find_or_create_by!(
          pais_id: pais.id,
          nome: estado[:nome],
          sigla: estado[:sigla],
          created_by: usuario.id,
          updated_by: usuario.id
        )
      end

      estado_ceara = Estado.find_by!(sigla: 'CE')

      municipios = [
        { nome: 'Fortaleza' }
      ]

       municipios.each do |municipio|
        Municipio.create!(
          estado_id: estado_ceara.id,
          nome: municipio[:nome],
          created_by: usuario.id,
          updated_by: usuario.id
        )
      end
    end
  end
rescue => e
  puts "Erro ao executar seeds: #{e.message}"
end
