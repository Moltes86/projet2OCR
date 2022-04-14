import Darwin

class NewGame {
    
    init(){
        gamePresentation()
    }
    
    func gamePresentation(){
        
    print("                                                         Hello, Bienvenue dans Mortal team combat\n")
    print("                                         Ce jeu se joue à 2, vous allez pouvoir , chacun votre tour, lancer des attaques\n")
    print("                     Vous allez devoir constituer chacun votre équipe de trois en choisissant parmis une liste de personnages et leur donner un nom\n")
        
    }
    
    func start(team1: [Personage], team2: [Personage]){
        
        print("""
                                                                    Vos équipes se compose de la manière suivante :

                                                                                    Joueur 1 :\n
""")
        for member in team1{
            print("""
                        \(member.name) est un \(member.type) qui peut infliger \(member.damage) points de dégât avec \(member.weapon) et qui a \(member.health) points de vie.\n
""")
        }
        
        print("                                                                         Joueur 2 : \n")
        for member in team2{
            print("""
                        \(member.name) est un \(member.type) qui peut infliger \(member.damage) points de dégât avec \(member.weapon) et qui a \(member.health) points de vie.\n
""")
        }
        
//        print("""
//                                                                    Vos équipes se compose de la manière suivante :
//""")
//        var i = 1
//        while i < 2{
//            print("""
//                                                                                        Joueur \(i) :\n
//    """)
//            for member in team1/*probleme comment alterner entre team1 et team2 à chaque tour*/{
//                print("""
//                    \(member.name) est un \(member.type) qui peut infliger \(member.damage) points de dégât avec \(member.weapon) et qui a \(member.health) points de vie.\n
//    """)
//            }
//            i += 1
//        }
    }
    
    func fight(/*myTeam: [Personnage], opposingTeam: [Personnage]*/){
        
        let perso1 = Magus(name: "maurice")
        let perso2 = Giant(name: "michel")
        let perso3 = Elf(name: "brian")
        let myTeam = [perso1, perso2, perso3]
        
        let perso4 = Warrior(name: "francois")
        let perso5 = Giant(name: "rocky")
        let perso6 = Elf(name: "moustache")
        let opposingTeam = [perso4, perso5, perso6]
        
        var memberChoosed: Personage?
        var oppMemberChoosed: Personage
        var action: String = ""
        
        var i = 1
        print("Quel joueur voulez vous envoyer au combat?\n")
        for member in myTeam{
            print("\(i). \(member.name)")
            i += 1
        }
        
        if let teamMemberChoice = readLine(){
            var teamMemberChoosed: String?
            while teamMemberChoosed == nil{
                switch teamMemberChoice{
                case "1":
                    let teamMemberIndex = 0
                    memberChoosed = myTeam[teamMemberIndex]
                case "2":
                    let teamMemberIndex = 1
                    memberChoosed = myTeam[teamMemberIndex]
                case "3":
                    let teamMemberIndex = 1
                    memberChoosed = myTeam[teamMemberIndex]
                default:
                    print("Vous devez choisir un numero de la liste")
                    teamMemberChoosed = nil
                }
            }
        }
        
        if memberChoosed!.type == "mage"{
            print("""
                  Pour ce personnage, tu as deux choix :
                              1. attaquer un adversaire
                              2. soigner un co équipié
                  """)
            if var actionChoice = readLine(){
                while actionChoice != "1" && actionChoice != "2"{
                    print("Vous devez choisir un numero de la liste")
                    if let newActionChoice = readLine(){
                        actionChoice = newActionChoice
                    }
                }
                action = actionChoice
            }
        }
        
    }
    
}
