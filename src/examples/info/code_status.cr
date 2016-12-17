class Examples::Info::CodeStatus
  getter all : Int32 = File.read("gen/cache/spec/count_all").to_i
  getter ok  : Int32 = File.read("gen/cache/spec/count_ok").to_i
  getter ng  : Int32 = File.read("gen/cache/spec/count_ng").to_i
  getter pd  : Int32 = File.read("gen/cache/spec/count_pd").to_i

  def ng?; ng > 0; end
  def pd?; pd > 0; end
  
  def to_s(io : IO)
    io << "%d (%d successes, %d  failures, %d  pending)" % [all, ok, ng, pd]
  end
end
