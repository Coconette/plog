updatePosition(Position, Laps, Score, NPosition, NLaps):-
	XPosition is Position + Score,
	(
	XPosition > 39 -> NPosition is XPosition - 40,
						NLaps is Laps + 1;
	NPosition is XPosition,
	NLaps is Laps
	).

updatePlayersInfo(Players, PlayersInfo, Turn, Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap, NPlayersInfo):-
	(
	Players = 2 -> NPlayersInfo = [Player1Info, Player2Info],
				(
				Turn = 1 -> getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
							Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
							Player1Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap];
				getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
				Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
				Player2Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap]
				);
	Players = 3 -> NPlayersInfo = [Player1Info, Player2Info, Player3Info],
				(
				Turn = 1 -> getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
							getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
							Player1Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
							Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3];
				Turn = 2 -> getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
							getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
							Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
							Player2Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3];
				getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
				getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
				Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
				Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
				Player3Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap]
				);	
	Players = 4 -> NPlayersInfo = [Player1Info, Player2Info, Player3Info, Player4Info],
				(
				Turn = 1 -> getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
							getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
							getPlayerInfo(PlayersInfo, 4, P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4, 0),
							Player1Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
							Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3],
							Player4Info = [P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4];
				Turn = 2 -> getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
							getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
							getPlayerInfo(PlayersInfo, 4, P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4, 0),
							Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
							Player2Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3],
							Player4Info = [P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4];
				Turn = 3 -> getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
							getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
							getPlayerInfo(PlayersInfo, 4, P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4, 0),
							Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
							Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
							Player3Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player4Info = [P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4];
				getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
				getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
				getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
				Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
				Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
				Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3],
				Player4Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap]
				);	
	Players = 5 -> NPlayersInfo = [Player1Info, Player2Info, Player3Info, Player4Info, Player5Info],
				(
				Turn = 1 -> getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
							getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
							getPlayerInfo(PlayersInfo, 4, P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4, 0),
							getPlayerInfo(PlayersInfo, 5, P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5, 0),
							Player1Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
							Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3],
							Player4Info = [P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4],
							Player5Info = [P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5];
				Turn = 2 -> getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
							getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
							getPlayerInfo(PlayersInfo, 4, P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4, 0),
							getPlayerInfo(PlayersInfo, 5, P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5, 0),
							Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
							Player2Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3],
							Player4Info = [P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4],
							Player5Info = [P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5];
				Turn = 3 -> getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
							getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
							getPlayerInfo(PlayersInfo, 4, P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4, 0),
							getPlayerInfo(PlayersInfo, 5, P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5, 0),
							Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
							Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
							Player3Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player4Info = [P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4],
							Player5Info = [P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5];
				Turn = 4 -> getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
							getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
							getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
							getPlayerInfo(PlayersInfo, 5, P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5, 0),
							Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
							Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
							Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3],
							Player4Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player5Info = [P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5];
				getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
				getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
				getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
				getPlayerInfo(PlayersInfo, 4, P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4, 0),
				Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
				Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
				Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3],
				Player4Info = [P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4],
				Player5Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap]
				);
	write('Error updating info.')
	).