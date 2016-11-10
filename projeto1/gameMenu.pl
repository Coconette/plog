chooseOption:-
	nl,
	getChar(Input),
	(
		Input = '1' -> initGame(1, Game), playGame(Game);
		Input = '2' -> initGame(2, Game), playGame(Game);
		Input = '3' -> initGame(3, Game), playGame(Game);
		Input = '4' -> initGame(4, Game), playGame(Game);
		Input = '5' -> initGame(5, Game), playGame(Game);

		nl,
		write('Error: invalid input.'), nl,
		read(Input), nl,
		initialMenu
	).

initialMenu:-
	nl,nl,
	write('         ******************'), nl,
	write('         * WELCOME TO IO! *'), nl,
	write('         ******************'),
	 nl,nl,nl, 
	write('Please select the number of players:'), nl,
	write('1 player'), nl,
	write('2 players'), nl, 
	write('3 players'), nl,
	write('4 players'), nl,
	write('5 players'), nl,
	chooseOption.
	
getChar(Input):-
	get_char(Input),
	get_char(_).
	
printStartGameInfo(Players):-
	nl, write('          Starting a '),
	write(Players), write(' player game!'), nl.