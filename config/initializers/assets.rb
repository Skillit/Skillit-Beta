# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( application.css )


Rails.application.config.assets.precompile += %w( home.css )

Rails.application.config.assets.precompile += %w( listings.css )

Rails.application.config.assets.precompile += %w( navbar.css )

Rails.application.config.assets.precompile += %w( project_skills.css )

Rails.application.config.assets.precompile += %w( projects.css )

Rails.application.config.assets.precompile += %w( skills.css )

Rails.application.config.assets.precompile += %w( talents.css )

Rails.application.config.assets.precompile += %w( users.css )

Rails.application.config.assets.precompile += %w( LandingPage.css )



