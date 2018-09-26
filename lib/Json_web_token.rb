# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

class JsonWebToken
    def self.encode(payload)
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def self.decode(token)
      return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.secrets.secret_key_base)[0]) # es en una sola linea
    rescue
      nil
    end
end