require File.expand_path('../test_helper', __FILE__)
require 'webrick'

class JavascriptTest < JavascriptFeatures::TestCase
  uses_html_body{ '<h1>Test page</h1>' }
  uses_feature_package :javascript_test
  tests_feature :enabled_feature

  should 'initialise the enabled feature' do
    puts page.body
    assert_selector_count 1, 'div.enabled_feature'
  end

  should 'not initialise the disabled feature' do
    assert_selector_count 0, 'div.disabled_feature'
  end

  should 'initialise the global feature' do
    assert_selector_count 1, 'div.global_feature'
  end
end
