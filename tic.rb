module Set_Mark


m=""

def set_mark(board,choice,mark)

    case choice
    when 1
    board[0][0]=="-" ? board[0][0]=mark :  m="There is already a mark here"
    when 2
    board[0][1]=="-" ? board[0][1]=mark :  m="There is already a mark here"
    when 3
    board[0][2]=="-" ? board[0][2]=mark :  m="There is already a mark here"
    when 4
    board[1][0]=="-" ? board[1][0]=mark :  m="There is already a mark here"
    when 5
    board[1][1]=="-" ? board[1][1]=mark :  m="There is already a mark here"
    when 6
    board[1][2]=="-" ? board[1][2]=mark :  m="There is already a mark here"
    when 7
    board[2][0]=="-" ? board[2][0]=mark :  m="There is already a mark here"
    when 8
    board[2][1]=="-" ? board[2][1]=mark :  m="There is already a mark here"
    when 9
    board[2][2]=="-" ? board[2][2]=mark :  m="There is already a mark here"
    end

    puts m


    end
  
   

end




class TicTacToe
    
    require 'matrix'
    include Set_Mark
    PLAYER_1_MARK='X'
    PLAYER_2_MARK='O'
    

    attr_reader :player1, :player2, :board, :winner

    def initialize
        @board=[['-','-','-'],
                ['-','-','-'],
                ['-','-','-']]

                print "You can choose the position you want to mark following this pattern \n"
                print "1 2 3\n4 5 6\n7 8 9\n "

        @winner=0
    
        
    end

    def create_players(player1,player2)
        @player1=player1
        @player2=player2

        puts "Player 1 is #{player1} and marks with X"
        puts "Player 2 is #{player2} and marks with O"
        
    end

    def place_choice(player,choice)
        if player==@player1
            set_mark(@board,choice,PLAYER_1_MARK)
            @winner=check_winner
        else
            set_mark(@board,choice,PLAYER_2_MARK)
            @winner=check_winner
        end

       display_board
    end

    def display_board
      @board.each do |row|
        puts row.join('')
      end
    end

    def check_winner

        arr=Matrix[*@board]

        @board.each { |row| 
            
            if row.join('')== "XXX"
                @winner=1
            elsif row.join('')== "OOO"
                @winner=2 
            end
        
        }    # row win
     
       for i in 0..2 
            if arr.column(i).to_a.join('')== "XXX"                             # Column win
              @winner=1
            elsif arr.column(i).to_a.join('')== "OOO"
                @winner=2
            end
        end
    
        @winner=1 if board[0][0]+board[1][1]+board[2][2]=="XXX" || board[0][2]+board[1][1]+board[2][0]=="XXX"
        @winner=2 if board[0][0]+board[1][1]+board[2][2]=="OOO" || board[0][2]+board[1][1]+board[2][0]=="OOO"

        return @winner

    end




end


game=TicTacToe.new

print "Player 1 enter your name : "
player1=gets.chomp

print "Player 2 enter your name : "
player2=gets.chomp

game.create_players(player1, player2)

player1_position=0
player2_position=0





game_is_on=true



def is_it_over? (b,w,p)


     if w==1 || w==2
        puts "#{p} wins !!"
        return false
    else
        b.each do |row| 
            if row.include?('-')
             return true
            else
                return true
            end
         end
     end

end

answer=0
while game_is_on do

    start_game

    puts "It's #{game.player1}'s turn..."
    player1_position=gets.chomp.to_i
    game.place_choice(player1,player1_position)

    game_is_on=is_it_over?(game.board,game.check_winner,game.player1)

    if game_is_on
    puts "It's #{game.player2}'s turn..."
    player2_position=gets.chomp.to_i
    game.place_choice(player2,player2_position)

    game_is_on=is_it_over?(game.board,game.check_winner,game.player2)
    end
 
    if !game_is_on
        puts "You want to start a new game ? y:yes | n:no"
        answer=gets.chomp.downcase
        if answer=="y"
            game_is_on=true
            game=TicTacToe.new
        end
    end
  

end




