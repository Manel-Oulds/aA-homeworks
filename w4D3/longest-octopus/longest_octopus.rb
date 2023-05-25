def quadratic_biggest_fish(fishes)
    longest_string = ""
  
    fishes.each do |string1|
      fishes.each do |string2|
        if string1.length > string2.length && string1.length > longest_string.length
          longest_string = string1
        end
      end
    end
    longest_string

end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def nlogn_biggest_fish(fishes)
  prc = Proc.new { |x, y| y.length <=> x.length }
  fishes.merge_sort(&prc).first
end

def linear_biggest_fish(fishes)
  longest_fish = fishes[0]

  fishes.each do |fish|
    if fish.length > longest_fish.length
      longest_fish = fish
    end
  end

  longest_fish
end



def slow_dance(direction, tiles)
  tiles.each_with_index do |tile, index|
    return index if tile == direction
  end
end


def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end