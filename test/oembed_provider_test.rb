require 'test_helper'

class OembedProviderTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, OembedProviderEngine
  end

  context "The OembedProvider object" do
    should "be able to set and return its provider name" do
      name = "Media Conglomerate International"
      OembedProviderEngine::OembedProvider.provider_name = name
      assert_equal OembedProviderEngine::OembedProvider.provider_name, name
    end

    should "be able to set and return its provider url" do
      url = "http://example.com"
      OembedProviderEngine::OembedProvider.provider_url = url
      assert_equal OembedProviderEngine::OembedProvider.provider_url, url
    end

    should "be able to set and return its cache age" do
      age = "1440"
      OembedProviderEngine::OembedProvider.cache_age = age
      assert_equal OembedProviderEngine::OembedProvider.cache_age, age
    end

    should "return version as 1.0 of oEmbed spec" do
      assert_equal "1.0", OembedProviderEngine::OembedProvider.version
    end

    should "have an array of base attribute keys" do
      base_attributes = [:provider_url,
                         :provider_name,
                         :cache_age,
                         :type,
                         :version]

      assert_equal OembedProviderEngine::OembedProvider.base_attributes, base_attributes
    end

    should "have an array of optional attribute keys" do
      optional_attributes = [:title,
                             :author_name,
                             :author_url,
                             :thumbnail_url,
                             :thumbnail_width,
                             :thumbnail_height]

      assert_equal OembedProviderEngine::OembedProvider.optional_attributes, optional_attributes
    end

    should "have a hash of keyed by oembed type with required attribute keys" do
      required_attributes = {
        :photo => [:url, :width, :height],
        :video => [:html, :width, :height],
        :link => [],
        :rich => [:html, :width, :height] }

      assert_equal OembedProviderEngine::OembedProvider.required_attributes, required_attributes
    end

    should "have a hash of keyed by oembed type photo with required attribute keys" do
      requires = [:url, :width, :height]
      assert_equal OembedProviderEngine::OembedProvider.required_attributes[:photo], requires
    end

    should "have a hash of keyed by oembed type video with required attribute keys" do
      requires = [:html, :width, :height]
      assert_equal OembedProviderEngine::OembedProvider.required_attributes[:video], requires
    end

    should "have a hash of keyed by oembed type link with required attribute keys" do
      requires = []
      assert_equal OembedProviderEngine::OembedProvider.required_attributes[:link], requires
    end

    should "have a hash of keyed by oembed type rich with required attribute keys" do
      requires = [:html, :width, :height]
      assert_equal OembedProviderEngine::OembedProvider.required_attributes[:rich], requires
    end

    context "have an cattr accessor for mapping controllers that aren't tableized version of models, to their corresponding models" do
      should "be able to set and read controller_model_maps" do
        assert OembedProviderEngine::OembedProvider.respond_to?(:controller_model_maps)
        assert_equal Hash.new, OembedProviderEngine::OembedProvider.controller_model_maps
        test_hash = { :images => 'StillImage' }
        OembedProviderEngine::OembedProvider.controller_model_maps = test_hash
        assert_equal test_hash, OembedProviderEngine::OembedProvider.controller_model_maps
        test_hash[:audio] = 'AudioRecording'
        OembedProviderEngine::OembedProvider.controller_model_maps[:audio] = 'AudioRecording'
        assert_equal test_hash, OembedProviderEngine::OembedProvider.controller_model_maps
      end
    end

    should "be able to answer find_provided_from with provided object based on passed in url" do
      photo = FactoryGirl.create(:photo)
      url = "http://example.com/photos/#{photo.id}"

      assert_equal photo, OembedProviderEngine::OembedProvider.find_provided_from(url)
    end

    should "raise RecordNotFound with non existent photo" do
      assert_raise ActiveRecord::RecordNotFound do
        OembedProviderEngine::OembedProvider.find_provided_from("http://example.com/photos/123")
      end
    end
  end
end


