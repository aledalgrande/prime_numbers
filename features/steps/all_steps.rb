Given /^the first (\d+) natural numbers$/ do |count|
  @naturals = count.to_i
end

Given /^the number (\d+)$/ do |num|
  @num = num.to_i
end

Given /^I've generated the time table for the first (\d+) prime numbers$/ do |count|
  primes = PrimeFinder.find(count.to_i, count.to_i*100)
  @timestables = primes.map{|p| PrimeFinder.timestable(p, p*10)}
end

When /^I search for the first (\d+) prime numbers$/ do |count|
  @prime_numbers = PrimeFinder.find(count.to_i, @naturals)
end

When /^I generate the time table until (\d+)$/ do |limit|
  @timestable = PrimeFinder.timestable(@num, limit.to_i)
end

When /^I look at the main page$/ do
  visit '/'
end

Then /^I should get the numbers "(.*?)"$/ do |numbers|
  @prime_numbers.join(',').should eq(numbers)
end

Then /^I should get the time table "(.*?)"$/ do |timestable|
  @timestable.join(',').should eq(timestable)
end

Then /^I should see all of their time tables$/ do
  @timestables.each do |timestable|
    page.should have_content(timestable.join(','))
  end
end