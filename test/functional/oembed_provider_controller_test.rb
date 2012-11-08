# -*- coding: utf-8 -*-
require 'test_helper'

class OembedProviderControllerTest < ActionController::TestCase

  tests OembedProviderEngine::OembedProviderController

  context "The oembed provider controller" do
    setup do
      @photo = FactoryGirl.create(:photo)
    end

    should "endpoint" do
      get :endpoint, :url => "http://example.com/photos/#{@photo.id}", use_route: "root"
      assert_response :success
    end

    should "endpoint with format json" do
      @request.accept = "text/javascript"
      get :endpoint, :url => "http://example.com/photos/#{@photo.id}", :format => 'json', use_route: "root"
      assert_response :success
    end

    should "endpoint with format json and callback, return json-p" do
      @request.accept = "text/javascript"
      get :endpoint, :url => "http://example.com/photos/#{@photo.id}", :format => 'json', :callback => 'myCallback', use_route: "root"
      assert_response :success
    end

    should "endpoint with format xml" do
      @request.accept = "text/xml"
      get :endpoint, :url => "http://example.com/photos/#{@photo.id}", :format => 'xml', use_route: "root"
      assert_response :success
    end

    context "base attributes" do
      setup do
        get :endpoint, :url => "http://example.com/photos/#{@photo.id}", :format => 'json', use_route: "root"
        @json = JSON.parse(response.body)
      end

      should "have version" do
        assert @json["version"].present?
      end

      should "have type" do
        assert_equal @json["type"], "photo"
      end
    end
  end
end

