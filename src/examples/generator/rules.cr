module Examples::Generator
  RULES = [
    # white lists
    Depend.new("big/big_decimal.cr", to: "big"),
    Depend.new("digest/base.cr", to: "digest/*"),
    Depend.new("http/formdata/builder.cr", to: "http"),
    Depend.new("http/formdata/generator.cr", to: "http"),
    Depend.new("http/formdata/parser.cr", to: "http"),
    Depend.new("http/multipart.cr", to: "http"),
    Depend.new("http/multipart/builder.cr", to: "http"),
    Depend.new("http/multipart/parser.cr", to: "http"),
    Depend.new("ini.cr"),
    Depend.new("json/from_json.cr", to: "json"),
    Depend.new("json/any.cr", to: "json"),
    Depend.new("secure_random.cr"),
    Depend.new("socket/address.cr", to: "socket"),
    Depend.new("socket/addrinfo.cr", to: "socket"),
    Depend.new("xml/node.cr", to: "xml"),
    Depend.new("yaml/schema/core.cr", to: "yaml"),
    Depend.new("zip/file.cr", to: "zip"),
    Depend.new("zip/reader.cr", to: "zip"),
    Depend.new("zip/writer.cr", to: "zip"),

    # black lists
    Deny.new("concurrent/future.cr"),
    Deny.new("io/memory.cr"),
    Deny.new("unicode/unicode.cr"),
    Deny.new(/^[^\/]+$/),
    Deny.new(/^compiler/),

    # default
    Depend.new(//),
  ]

  module RequireRule
    abstract def match?(name : String) : Bool
    abstract def code(name : String) : String?
  end

  record Depend,
    pattern : String | Regex,
    to : String? = nil do
    include RequireRule

    def match?(name : String)
      @pattern === name
    end

    def code(name : String) : String?
      to = @to || name.sub(/\.cr$/, "")
      %(require "#{to}")
    end
  end

  record Deny,
    pattern : String | Regex do
    include RequireRule

    def match?(name : String)
      @pattern === name
    end

    def code(name : String)
      nil
    end
  end
end
