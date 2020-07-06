def find_outlier(integers)
  hash = {}
  integers.map{|i| hash[i] = (i % 2 == 0) ? "even" : "odd"}
  hash.values.count("even") < hash.values.count("odd") ? hash.key("even") : hash.key("odd")
end