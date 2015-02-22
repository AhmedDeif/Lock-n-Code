# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( myArticle.css )
Rails.application.config.assets.precompile += %w( bootstrap.css )
Rails.application.config.assets.precompile += %w( reset.css )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( modernizr.js )
Rails.application.config.assets.precompile += %w( sprites/social-share-button.png )
Rails.application.config.assets.precompile += %w( sprites/social-share-button@2x.png )
Rails.application.config.assets.precompile += %w( cd-logo.svg )
Rails.application.config.assets.precompile += %w( articlesIndex.css )
Rails.application.config.assets.precompile += %w( user_000000_16.png )
Rails.application.config.assets.precompile += %w( envelope_000000_16.png )
Rails.application.config.assets.precompile += %w( lock_000000_16.png )
Rails.application.config.assets.precompile += %w( pencil-square_000000_16.png )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
