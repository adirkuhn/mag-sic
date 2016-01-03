# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += [
    "application.css",
    "home.js", "home.css",
    "devise/sessions.js", "devise/sessions.css",
    "users/registrations.js", "users/registrations.css",
    "admin.js", "admin.css",
    "companies.js", "companies.css",
    "moots.js", "moots.css",
    "rullings.js", "rullings.css"
]
