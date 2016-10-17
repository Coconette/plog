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
 nl,nl,
chooseOption. %Da erro??? %

%funcao em separado funciona, mas nao chama "game"%
chooseOption(X):-
read(X)
Game(X).
 %da erro%
Game(X):-
write('Im here').