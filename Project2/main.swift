var newGame = NewGame()
//

let perso1 = Magus(name: "maurice")
let perso2 = Giant(name: "michel")
let perso3 = Elf(name: "brian")
let myTeam = [perso1, perso2, perso3]

let perso4 = Warrior(name: "francois")
let perso5 = Giant(name: "rocky")
let perso6 = Elf(name: "moustache")
let opposingTeam = [perso4, perso5, perso6]

newGame.start(team1: myTeam, team2: opposingTeam)

//print("                                                                 Joueur 1, à vous de commencer :\n")
//let player1 = Player()
//print("                                                                     Joueur 2, c'est à vous :\n")
//let player2 = Player(otherTeam: player1.team)
