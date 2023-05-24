class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while game_over == false
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if game_over == false
      round_success_message
      @sequence_length+=1
    end
  end

  def show_sequence
    add_random_color
    seq.each do |c|
      p c
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    p 'Your turn! Enter the sequence in order!'
    sequence_length.times do 
      v = gets.chomp
      game_over = true if v != seq.shift
      break
    end
    
  end

  def add_random_color
    seq<< COLORS.sample
  end

  def round_success_message
    p 'Victory!'
  end

  def game_over_message
    p "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end