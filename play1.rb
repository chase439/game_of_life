size = 30
board = Array.new(size*size) { rand(2) }

loop do
  # print board
  board.each.with_index do |cell, index|
    print "\n" if index % size == 0
    print cell
  end

  # calculate next generation 
  board = board.map.with_index do |cell, index|
    sum = 0
    n=index-size
    s=index+size
    w=index-1
    e=index+1

    # NOTE: the || is used to catch going outside the array boundary
    # TODO: I think there's a bug here where west and east boundaries are not checked.
    sum += board[n] || 0
    sum += board[s] || 0
    sum += board[w] || 0
    sum += board[e] || 0
    sum += board[n-1] || 0
    sum += board[n+1] || 0
    sum += board[s-1] || 0
    sum += board[s+1] || 0

    if board[index] == 0 # dead
      if sum == 3
        1
      else
        0
      end
    else # alive
      if sum < 2 || sum > 3
        0
      else
        1
      end
    end
  end

  sleep 0.1  # add delay to see animation
  puts "\n" * 100  # clear screen
end
