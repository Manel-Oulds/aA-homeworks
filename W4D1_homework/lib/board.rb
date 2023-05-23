class Board
  attr_reader :cups

  def initialize(player1, player2)
    @cups = Array.new(14) { [] }
    place_initial_stones
  end

  def valid_move?(start_cup)
    raise "Invalid starting cup" if start_cup < 0 || start_cup > 12
    raise "Starting cup is empty" if @cups[start_cup].empty?
  end

  def make_move(start_cup, current_player_name)
    stones = cups[start_cup]
    cups[start_cup] = []

    cup_idx = start_cup
    until stones.empty?
      cup_idx = (cup_idx + 1) % 14
      next if cup_idx == opponent_cup(current_player_name)

      cups[cup_idx] << stones.pop
    end

    render
    next_turn(cup_idx)
  end

  def one_side_empty?
    cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
  end

  def winner
    player1_points = cups[6].length
    player2_points = cups[13].length

    if player1_points == player2_points
      :draw
    else
      player1_points > player2_points ? "Erica" : "James"
    end
  end

  private

  def place_initial_stones
    cups[0..5] = Array.new(6) { [:stone, :stone, :stone, :stone] }
    cups[7..12] = Array.new(6) { [:stone, :stone, :stone, :stone] }
  end

  def opponent_cup(current_player_name)
    current_player_name == "Erica" ? 13 : 6
  end


  def next_turn(cup_idx)
    
  end



  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

end