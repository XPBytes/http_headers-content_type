require 'test_helper'

module HttpHeaders
  class AcceptTest < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::HttpHeaders::ContentType::VERSION
    end

    def test_it_parses_empty
      ContentType.new('')
      pass 'did not break'
    end

    def test_it_parses_one_without_parameters
      parsed = ContentType.new('application/json')
      assert_equal 'application/json', parsed.content_type
      assert_equal 'application/json', parsed.to_s
    end

    def test_it_parses_parameters
      parsed = ContentType.new('application/json; foo=bar; charset=utf-8')
      assert_equal 'bar', parsed[:foo]
      assert_equal 'utf-8', parsed.charset
    end

    def test_it_parses_multiple_lines
      parsed = ContentType.new(['text/plain', 'application/json; charset=utf-8, text/html; charset=utf-8'])
      assert_equal 'text/html', parsed.content_type
      assert_equal 'text/html; charset=utf-8', parsed.to_s
    end
  end
end
