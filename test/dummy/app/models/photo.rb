class Photo < ActiveRecord::Base
  include OembedProviderEngine::OembedProvidable
  oembed_providable_as :photo
end
