def non_divisible_subset(k, s)
  remaining = Array.new(k, 0)

  s.each do |num|
    remaining[num % k] += 1
  end

  total_elements = [remaining[0], 1].min

  for i in 1..k/2 do
    if k.even? and i == k/2
      total_elements = total_elements + [remaining[i], 1].min
    else
      total_elements = total_elements + [remaining[i], remaining[k - i]].max
    end
  end

  total_elements
end


s = [1, 7, 2, 4]
k = 3

p "The maximum length solution is: #{non_divisible_subset(k, s)}"
