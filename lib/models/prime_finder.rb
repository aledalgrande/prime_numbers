class PrimeFinder
  
  # Finds count prime numbers, in a numbers set
  def self.find(count, numbers_set)
    primes = self.first_n_naturals(numbers_set) - [1]
    i = 0
    while i < primes.size && i != count do
      primes -= (self.timestable(primes.at(i), numbers_set) - [primes.at(i)])
      i += 1
    end
    primes.take(count)
  end
  
  # Finds the times table of a single number, within an arbitrary limit
  def self.timestable(number, limit=100)
    (1..limit/number).inject([]){|memo, n| memo << n*number}
  end
  
  # Generates first n naturals
  def self.first_n_naturals(n)
    (1..n).inject([]){|memo, obj| memo << obj}
  end
  
end