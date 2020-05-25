module Set_Mark

def set_mark(board,choice,mark)
    case choice
    when 1
     board[0][0]=="-" ? board[0][0]=mark : "There is already a mark here"
    when 2
     board[0][1]=="-" ? board[0][1]=mark : "There is already a mark here"
    when 3
    board[0][2]=="-" ? board[0][2]=mark : "There is already a mark here"
    when 4
    board[1][0]=="-" ? board[1][0]=mark : "There is already a mark here"
    when 5
    board[1][1]=="-" ? board[1][1]=mark : "There is already a mark here"
    when 6
    board[1][2]=="-" ? board[1][2]=mark : "There is already a mark here"
    when 7
    board[2][0]=="-" ? board[2][0]=mark : "There is already a mark here"
    when 8
    board[2][1]=="-" ? board[2][1]=mark : "There is already a mark here"
    when 9
    board[2][2]=="-" ? board[2][2]=mark : "There is already a mark here"
    end
end



end



class TicTacToe

    include Set_Mark
    PLAYER_1_MARK="X"
    PLAYER_2_MARK="O"

    def initialize
        @board=[['-','-','-'],
                ['-','-','-'],
                ['-','-','-']
    ]
        
    end

    def create_players(player1,player2)
        @player1=player1
        @player2=player2
    end

    def place_choice(player,choice)
        if player==@player1
            set_mark(@board,choice,PLAYER_1_MARK)
        else
            set_mark(@board,choice,PLAYER_2_MARK)
        end

       display_board
    end

    def display_board
      @board.each do |row|
        print row,"\n"
      end
    end



end

game=TicTacToe.new

game.create_players("Me", "You")

game.place_choice("Me",1)

puts "next play"
game.place_choice("You",2)

puts "next play"
game.place_choice("Me",4)

puts "next play"
game.place_choice("You",3)

puts "next play"
game.place_choice("Me",8)



