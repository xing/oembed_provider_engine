class Item < ActiveRecord::Base
  include OembedProviderEngine::OembedProvidable
  oembed_providable_as :link, :title => :label
end
