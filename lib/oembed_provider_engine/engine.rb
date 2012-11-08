module OembedProviderEngine
  class Engine < ::Rails::Engine
    isolate_namespace OembedProviderEngine

    initializer 'oembed_provider_engine.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper ::OembedProviderEngine::OembedProviderHelper
      end
    end
  end
end
