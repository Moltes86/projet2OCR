var newGame = NewGame()
//
//var team = newGame.start()
//
//
//print(team)

//let player1 = newGame.createPlayer()
print("                                                                 Joueur 1, à vous de commencer :\n")
let player1 = Player()
print("                                                                     Joueur 2, c'est à vous :\n")
let player2 = Player(otherTeam: player1.team)
