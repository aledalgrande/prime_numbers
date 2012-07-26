require 'sinatra/base'
require 'erubis'
Dir[File.join(File.dirname(__FILE__), 'lib', 'models', '*.rb')].each {|file| require file }

class PrimeNumbers < Sinatra::Base
  
  get '/?' do
    primes = PrimeFinder.find(10, 40)
    @timestables = primes.map{|p| {p => PrimeFinder.timestable(p, p*10).join(',')} }
    erb :index
  end
  
end