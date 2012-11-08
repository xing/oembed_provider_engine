OembedProviderEngine::Engine.routes.draw do
  match "/(.:format)" => "oembed_provider#endpoint"
end
