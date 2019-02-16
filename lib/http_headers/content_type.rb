require 'http_headers/utils/single'

module HttpHeaders
  module ContentType
    VERSION = '0.1.0'

    class << self
      def new(value)
        Utils::Single.new(value, entry_klazz: Entry)
      end
    end

    class Entry
      def initialize(content_type, parameters:, **_opts) # swallow index:
        self.content_type = content_type
        self.parameters = parameters

        freeze
      end

      attr_reader :content_type

      # noinspection RubyInstanceMethodNamingConvention
      def charset
        parameters.fetch(:charset) { nil }
      end

      def [](parameter)
        parameters.fetch(String(parameter).to_sym)
      end

      def to_header
        to_s
      end

      def to_s
        [content_type].concat(parameters.map { |k, v| "#{k}=#{v}" }).compact.reject(&:empty?).join('; ')
      end

      private

      attr_writer :content_type
      attr_accessor :parameters
    end
  end
end
