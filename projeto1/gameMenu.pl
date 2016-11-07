game(2):- 
nl, 
write('          Starting a 2 player game!').

game(3):- 
nl, 
write('          Starting a 3 player game!').

game(4):- 
nl, 
write('          Starting a 4 player game!').

game(5):- 
nl, 
write('          Starting a 5 player game!').

chooseOption:-
nl,
read(Input),
game(Input).

initialMenu:-

nl,nl,
write('          WELCOME TO IO! '),
 nl,nl,nl,nl,nl, 
write('Please select the number of players'),
 nl,nl, 
write('2 players'),
 nl, 
write('3 players'), 
 nl, 
write('4 players'),
 nl,
write('5 players'),
 nl,nl,
chooseOption.
