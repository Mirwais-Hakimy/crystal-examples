class Examples::Cache < Hash(String, String)
  DELIMITER = /\t/

  var file_name : String
  var clues = Hash(String, String).new

  def load(file, strict = false)
    self.file_name = file
    if !File.exists?(file)
      raise "file not found: #{file}" if strict
      return
    end
    clear
    line_no = 0
    File.each_line(file) do |line|
      line_no += 1
      ary = line.chomp.split(DELIMITER, 3)
      raise "invalid entry: (line=#{line_no}) #{line}" if ary.size < 2 && strict
      clues[ary[0]] = ary[2] if ary[2]?
      self[ary[0]] = ary[1]
    end
  end

  def save
    buf = String.build do |s|
      each do |key, val|
        clue = clues[key]?
        s << "#{key}\t#{val}"
        s << "\t#{clue}" if clue
        s << "\n"
      end
    end
    File.write(file_name, buf)
  end

  def try_bool?(key) : Try(Bool)
    Try(Bool).try {
      val = self[key]? || raise "not found #{key}"
      case val
      when "1" ; true
      when "0" ; false
      else     ; raise "unknown value: {#{key}, #{val}}"
      end
    }
  end

  def bool?(key) : Bool
    try = try_bool?(key)
    try.success? && try.get
  end

  def bool(key, val : Bool, clue = nil)
    set(key, val ? "1" : "0", clue)
  end

  def set(key, val : String, clue = nil)
    clues[key] = clue.not_nil! if clue
    self[key] = val
  end

  def entry?(key)
    val = self[key]?
    if val
      clue = clues[key]?
      "#{key}\t#{val}\t#{clue}"
    else
      nil
    end
  end
end

class Examples::Cache
  COMPILE_CACHE = "gen/cache/compile/cache"
  SPEC_CACHE    = "gen/cache/spec/cache"

  def self.load(file)
    new.tap(&.load(file))
  end

  def self.compile_cache
    load(COMPILE_CACHE)
  end

  def self.spec_cache
    load(SPEC_CACHE)
  end
end
