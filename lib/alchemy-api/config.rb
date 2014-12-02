module AlchemyAPI
  class Config
    class << self
      attr_accessor :apikey
      attr_accessor :modes
      attr_accessor :use_ssl
      attr_writer :faraday_options
    end

    def self.add_mode(key, klass)
      @modes = {} unless @modes

      @modes[key] = klass
    end

    def self.default_options
      {
        outputMode: output_mode
      }
    end

    def self.output_mode
      @output_mode || :json
    end

    def self.faraday_options
      @faraday_options ||= {}
    end

    def self.output_mode=(value)
      fail InvalidOutputMode unless valid_output_modes.include?(value.to_s)

      @output_mode = value
    end

    def self.valid_output_modes
      ['xml', 'json', 'rdf', 'rel-tag', 'rel-tag-raw']
    end
  end
end
