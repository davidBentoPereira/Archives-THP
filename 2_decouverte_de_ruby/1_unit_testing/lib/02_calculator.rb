def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def multiply(a, b)
  a * b
end

def sum(arr)
  arr.inject{ |sum, el| sum + el }.to_f
end

def power (number, power)
  number**power
end

def factorial(n)
  (1..n).inject(:*) || 1
end