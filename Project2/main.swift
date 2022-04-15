var newGame = NewGame()
//
//
//let perso1 = Magus(name: "maurice")
//let perso2 = Giant(name: "michel")
//let perso3 = Elf(name: "brian")
//let myTeam = [perso1, perso2, perso3]
//
//let perso4 = Warrior(name: "francois")
//let perso5 = Giant(name: "rocky")
//let perso6 = Elf(name: "moustache")
//let opposingTeam = [perso4, perso5, perso6]
//

let Player1 = Player(name: "Joueur 1")
let Player2 = Player(otherTeam: Player1.team, name: "Joueur 2")

newGame.start(team1: Player1.team, team2: Player2.team)
