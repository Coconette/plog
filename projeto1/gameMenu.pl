game(Players):-
nl, write('          Starting a '),
write(Players), write(' player game!'),
test(Players, 0).

chooseOption:-
nl,
getChar(Input),
	(
		Input = '1' -> game(1);
		Input = '2' -> game(2);
		Input = '3' -> game(3);
		Input = '4' -> game(4);
		Input = '5' -> game(5);

		nl,
		write('Error: invalid input.'), nl,
		read(Input), nl,
		initialMenu
	).

initialMenu:-

nl,nl,
write('          WELCOME TO IO! '),
 nl,nl,nl,nl,nl, 
write('Please select the number of players'), nl, nl,
write('1 player'), nl,
write('2 players'), nl, 
write('3 players'), nl, 
write('4 players'), nl,
write('5 players'), nl,nl,
chooseOption.

getChar(Input):-
	get_char(Input),
	get_char(_).
	
test(Players, Random):-
	Random < Players -> nl, write('pila'),
	NewRandom is Random + 1, test(Players, NewRandom).