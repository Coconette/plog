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
								placeObjectOnBoard(YBoard, NBoard, '-', 0, 12);
				Flower = '&' -> placeObjectOnBoard(Board, XBoard, '&', TreeRow, TreeCol),
								placeObjectOnBoard(XBoard, YBoard, 'X', FlowerRow, FlowerCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 0, 12);
				Flower = '#' -> placeObjectOnBoard(Board, XBoard, '#', TreeRow, TreeCol),
								placeObjectOnBoard(XBoard, YBoard, 'X', FlowerRow, FlowerCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 0, 12);
				Flower = '*' -> placeObjectOnBoard(Board, XBoard, '*', TreeRow, TreeCol),
								placeObjectOnBoard(XBoard, YBoard, 'X', FlowerRow, FlowerCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 0, 12);
				Flower = '+' -> placeObjectOnBoard(Board, XBoard, '+', TreeRow, TreeCol),
								placeObjectOnBoard(XBoard, YBoard, 'X', FlowerRow, FlowerCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 0, 12);
				Flower = '@' -> placeObjectOnBoard(Board, XBoard, '@', TreeRow, TreeCol),
								placeObjectOnBoard(XBoard, YBoard, 'X', FlowerRow, FlowerCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 0, 12);
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
	
thirdAction(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo):-
	write('MOVE FLOWER'), nl,
	write('Input coords of flower'), nl,
	inputCoords(FlowerRow, FlowerCol),
	getObjectOnBoard(Board, Flower, FlowerRow, FlowerCol),
	(
	Flower = '$' -> write('Input coords to move'), nl,
				inputCoords(EmptyRow, EmptyCol),
				getObjectOnBoard(Board, Empty, FlowerRow, FlowerCol),
				(
				Empty = '0' -> placeObjectOnBoard(Board, XBoard, ' ', FlowerRow, FlowerCol),
								placeObjectOnBoard(XBoard, YBoard, '$', EmptyRow, EmptyCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 2, 12);
				write('Error. That is not an empty space.'), nl
				);
	Flower = '&' -> write('Input coords to move'), nl,
				inputCoords(EmptyRow, EmptyCol),
				getObjectOnBoard(Board, Empty, FlowerRow, FlowerCol),
				(
				Empty = '0' -> placeObjectOnBoard(Board, XBoard, ' ', FlowerRow, FlowerCol),
								placeObjectOnBoard(XBoard, YBoard, '&', EmptyRow, EmptyCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 2, 12);
				write('Error. That is not an empty space.'), nl
				);
	Flower = '#' -> write('Input coords to move'), nl,
				inputCoords(EmptyRow, EmptyCol),
				getObjectOnBoard(Board, Empty, FlowerRow, FlowerCol),
				(
				Empty = '0' -> placeObjectOnBoard(Board, XBoard, ' ', FlowerRow, FlowerCol),
								placeObjectOnBoard(XBoard, YBoard, '#', EmptyRow, EmptyCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 2, 12);
				write('Error. That is not an empty space.'), nl
				);
	Flower = '*' -> write('Input coords to move'), nl,
				inputCoords(EmptyRow, EmptyCol),
				getObjectOnBoard(Board, Empty, FlowerRow, FlowerCol),
				(
				Empty = '0' -> placeObjectOnBoard(Board, XBoard, ' ', FlowerRow, FlowerCol),
								placeObjectOnBoard(XBoard, YBoard, '*', EmptyRow, EmptyCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 2, 12);
				write('Error. That is not an empty space.'), nl
				);
	Flower = '+' -> write('Input coords to move'), nl,
				inputCoords(EmptyRow, EmptyCol),
				getObjectOnBoard(Board, Empty, FlowerRow, FlowerCol),
				(
				Empty = '0' -> placeObjectOnBoard(Board, XBoard, ' ', FlowerRow, FlowerCol),
								placeObjectOnBoard(XBoard, YBoard, '+', EmptyRow, EmptyCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 2, 12);
				write('Error. That is not an empty space.'), nl
				);
	Flower = '@' -> write('Input coords to move'), nl,
				inputCoords(EmptyRow, EmptyCol),
				getObjectOnBoard(Board, Empty, FlowerRow, FlowerCol),
				(
				Empty = '0' -> placeObjectOnBoard(Board, XBoard, ' ', FlowerRow, FlowerCol),
								placeObjectOnBoard(XBoard, YBoard, '@', EmptyRow, EmptyCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 2, 12);
				write('Error. That is not an empty space.'), nl
				);
	write('Error. There are no trees on the coords indicated.'), nl	
	).

fourthAction(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo):-
	write('MOVE TREE'), nl,
	write('Input coords of tree'), nl,
	inputCoords(TreeRow, TreeCol),
	getObjectOnBoard(Board, Tree, TreeRow, TreeCol),
	(
	Tree = 'X' -> write('Input coords to move'), nl,
				inputCoords(EmptyRow, EmptyCol),
				getObjectOnBoard(Board, Empty, FlowerRow, FlowerCol),
				(
				Empty = '0' -> placeObjectOnBoard(Board, XBoard, ' ', TreeRow, TreeCol),
								placeObjectOnBoard(XBoard, YBoard, 'X', EmptyRow, EmptyCol),
								placeObjectOnBoard(YBoard, NBoard, '-', 3, 12);
				write('Error. That is not an empty space.'), nl
				);
	write('Error. There are no trees on the coords indicated.'), nl	
	).
	
goToSecond(Board, First, FirstRow, FirstCol, NBoard):-
	write('Input coords of second flower'), nl,
	inputCoords(SecondRow, SecondCol),
	getObjectOnBoard(Board, Second, SecondRow, SecondCol),
	(
	Second = '$' -> placeObjectOnBoard(Board, XBoard, '$', FirstRow, FirstCol),
					placeObjectOnBoard(XBoard, YBoard, First, SecondRow, SecondCol),
					placeObjectOnBoard(YBoard, NBoard, '-', 1, 12);
	Second = '&' -> placeObjectOnBoard(Board, XBoard, '&', FirstRow, FirstCol),
					placeObjectOnBoard(XBoard, YBoard, First, SecondRow, SecondCol),
					placeObjectOnBoard(YBoard, NBoard, '-', 1, 12);
	Second = '#' -> placeObjectOnBoard(Board, XBoard, '#', FirstRow, FirstCol),
					placeObjectOnBoard(XBoard, YBoard, First, SecondRow, SecondCol),
					placeObjectOnBoard(YBoard, NBoard, '-', 1, 12);
	Second = '*' -> placeObjectOnBoard(Board, XBoard, '*', FirstRow, FirstCol),
					placeObjectOnBoard(XBoard, YBoard, First, SecondRow, SecondCol),
					placeObjectOnBoard(YBoard, NBoard, '-', 1, 12);
	Second = '+' -> placeObjectOnBoard(Board, XBoard, '+', FirstRow, FirstCol),
					placeObjectOnBoard(XBoard, YBoard, First, SecondRow, SecondCol),
					placeObjectOnBoard(YBoard, NBoard, '-', 1, 12);
	Second = '@' -> placeObjectOnBoard(Board, XBoard, '@', FirstRow, FirstCol),
					placeObjectOnBoard(XBoard, YBoard, First, SecondRow, SecondCol),
					placeObjectOnBoard(YBoard, NBoard, '-', 1, 12);
	write('Error. There are no flowers on the coords indicated.')
	).
	