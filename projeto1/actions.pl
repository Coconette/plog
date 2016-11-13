firstAction(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo):-
	write('SWAP TREE AND FLOWER'), nl,
	write('Input coords of tree'), nl,
	inputCoords(TreeRow, TreeCol),
	getObjectOnBoard(Board, Tree, TreeRow, TreeCol),
	(
	Tree = 'X' -> write('Input coords of flower'), nl,
				inputCoords(FlowerRow, FlowerCol),
				getObjectOnBoard(Board, Flower, FlowerRow, FlowerCol),
				(
				Flower = '$' -> placeObjectOnBoard(Board, XBoard, '$', TreeRow, TreeCol),
								placeObjectOnBoard(XBoard, YBoard, 'X', FlowerRow, FlowerCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 0, 12),
								write('Action Used Successfully'), nl, nl;
				Flower = '&' -> placeObjectOnBoard(Board, XBoard, '&', TreeRow, TreeCol),
								placeObjectOnBoard(XBoard, YBoard, 'X', FlowerRow, FlowerCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 0, 12),
								write('Action Used Successfully'), nl, nl;
				Flower = '#' -> placeObjectOnBoard(Board, XBoard, '#', TreeRow, TreeCol),
								placeObjectOnBoard(XBoard, YBoard, 'X', FlowerRow, FlowerCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 0, 12),
								write('Action Used Successfully'), nl, nl;
				Flower = '*' -> placeObjectOnBoard(Board, XBoard, '*', TreeRow, TreeCol),
								placeObjectOnBoard(XBoard, YBoard, 'X', FlowerRow, FlowerCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 0, 12),
								write('Action Used Successfully'), nl, nl;
				Flower = '+' -> placeObjectOnBoard(Board, XBoard, '+', TreeRow, TreeCol),
								placeObjectOnBoard(XBoard, YBoard, 'X', FlowerRow, FlowerCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 0, 12),
								write('Action Used Successfully'), nl, nl;
				Flower = '@' -> placeObjectOnBoard(Board, XBoard, '@', TreeRow, TreeCol),
								placeObjectOnBoard(XBoard, YBoard, 'X', FlowerRow, FlowerCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 0, 12),
								write('Action Used Successfully'), nl, nl;
				write('Error. There are no flowers on the coords indicated.')
				);
	write('Error. There are no trees on the coords indicated.')
	).

secondAction(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo):-
	write('SWAP FLOWERS'), nl,
	write('Input coords of first flower'), nl,
	inputCoords(FirstRow, FirstCol),
	getObjectOnBoard(Board, First, FirstRow, FirstCol),
	(
	First = '$' -> goToSecond(Board, '$', FirstRow, FirstCol, NBoard);
	First = '&' -> goToSecond(Board, '&', FirstRow, FirstCol, NBoard);
	First = '#' -> goToSecond(Board, '#', FirstRow, FirstCol, NBoard);
	First = '*' -> goToSecond(Board, '*', FirstRow, FirstCol, NBoard);
	First = '+' -> goToSecond(Board, '+', FirstRow, FirstCol, NBoard);
	First = '@' -> goToSecond(Board, '@', FirstRow, FirstCol, NBoard);
	write('Error. There are no flowers on the coords indicated.')
	).
	
goToSecond(Board, First, FirstRow, FirstCol, NBoard):-
	write('Input coords of second flower'), nl,
	inputCoords(SecondRow, SecondCol),
	getObjectOnBoard(Board, Second, SecondRow, SecondCol),
	(
	Second = '$' -> placeObjectOnBoard(Board, XBoard, '$', FirstRow, FirstCol),
					placeObjectOnBoard(XBoard, YBoard, First, SecondRow, SecondCol),
					placeObjectOnBoard(YBoard, NBoard, '-', 1, 12),
					write('Action Used Successfully'), nl, nl;
	Second = '&' -> placeObjectOnBoard(Board, XBoard, '&', FirstRow, FirstCol),
					placeObjectOnBoard(XBoard, YBoard, First, SecondRow, SecondCol),
					placeObjectOnBoard(YBoard, NBoard, '-', 1, 12),
					write('Action Used Successfully'), nl, nl;
	Second = '#' -> placeObjectOnBoard(Board, XBoard, '#', FirstRow, FirstCol),
					placeObjectOnBoard(XBoard, YBoard, First, SecondRow, SecondCol),
					placeObjectOnBoard(YBoard, NBoard, '-', 1, 12),
					write('Action Used Successfully'), nl, nl;
	Second = '*' -> placeObjectOnBoard(Board, XBoard, '*', FirstRow, FirstCol),
					placeObjectOnBoard(XBoard, YBoard, First, SecondRow, SecondCol),
					placeObjectOnBoard(YBoard, NBoard, '-', 1, 12),
					write('Action Used Successfully'), nl, nl;
	Second = '+' -> placeObjectOnBoard(Board, XBoard, '+', FirstRow, FirstCol),
					placeObjectOnBoard(XBoard, YBoard, First, SecondRow, SecondCol),
					placeObjectOnBoard(YBoard, NBoard, '-', 1, 12),
					write('Action Used Successfully'), nl, nl;
	Second = '@' -> placeObjectOnBoard(Board, XBoard, '@', FirstRow, FirstCol),
					placeObjectOnBoard(XBoard, YBoard, First, SecondRow, SecondCol),
					placeObjectOnBoard(YBoard, NBoard, '-', 1, 12),
					write('Action Used Successfully'), nl, nl;
	write('Error. There are no flowers on the coords indicated.')
	).