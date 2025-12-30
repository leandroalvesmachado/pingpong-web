# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Adiciona o caminho para as pastas CSS, JS e IMG do AdminLTE
Rails.application.config.assets.paths << Rails.root.join("vendor", "adminlte-3.2.0")
