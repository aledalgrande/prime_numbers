class PrimeFinder
  
  # finds count prime numbers, in a numbers set
  def self.find(count, numbers_set)
    primes = self.first_n_naturals(numbers_set)
    i = 0
    while i < primes.size && i != count do
      primes -= (self.timestable(primes.at(i), numbers_set) - [primes.at(i)])
      i += 1
    end
    primes.take(count)
  end
  
  # Finds the time table of a number, within an arbitrary limit
  def self.timestable(number, limit=100)
    multiples = []
    n = 1
    while n*number <= limit do
      multiples << n*number
      n += 1
    end
    multiples
  end
  
  private
  def self.first_n_naturals(n)
    naturals = []
    n.to_i.times {|i| naturals << i+1 if i+1 > 1}
    naturals
  end
  
end