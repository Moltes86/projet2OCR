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
    
    func teamPresentation(team: [Personage], i: String){
        
            print("""
                                                                                        Joueur \(i) :\n
    """)
            for member in team{
                print("""
                    \(member.name) est un \(member.type) qui peut infliger \(member.damage) points de dégât avec \(member.weapon) et qui a \(member.health) points de vie.\n
    """)
            }
        
    }
    
    func start(team1: [Personage], team2: [Personage]){
        
        print("""
                                                                    Vos équipes se compose de la manière suivante :
""")
        teamPresentation(team: team1, i: "1")
        teamPresentation(team: team2, i: "2")
        
        print("                                                Les équipes sont constituées, le jeu peut maintenant commencer\n")
        
        while team1.count > 0 || team2.count > 0{
            print("Joueur 1 c'est à vous de jouer\n")
            fight(myTeam: team1, opposingTeam: team2)
            print("Joueur 2 c'est à votre tour\n")
            fight(myTeam: team2, opposingTeam: team1)
        }
        
    }
    
    func fight(myTeam: [Personage], opposingTeam: [Personage]){
        
        print("Quel joueur voulez vous envoyer au combat?\n")
        let memberChoosed = chooseMemberTeam(team: myTeam)
        print(memberChoosed.type)
        
        if memberChoosed.type == "mage"{
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
                if actionChoice == "2"{
                    print("Quel co équipié voulez vous soigner?\n")
                    let secondMemberChoosed = chooseMemberTeam(team: myTeam)
                    memberChoosed.healing(friend: secondMemberChoosed)
                    print("\(memberChoosed.name) a soigné \(secondMemberChoosed.name)\n")
                    
                }
            }
        }
        print("Quel joueur voulez vous attaquer?\n")
        let oppMemberChoosed = chooseMemberTeam(team: opposingTeam)
        print(oppMemberChoosed.name)
        memberChoosed.makeDamage(victim: oppMemberChoosed)
        print("\(memberChoosed.name) a attaqué \(oppMemberChoosed.name)\n")
        
    }
    
    func chooseMemberTeam(team: [Personage]) -> Personage{
        
        var memberChoosed: Personage?
        
        var i = 1
        for member in team{
            print("\(i). \(member.name) ( \(member.type) )")
            i += 1
        }
        
        var teamMemberChoosed: Int?
        while teamMemberChoosed == nil{
            if let teamMemberChoice = readLine(){
                switch teamMemberChoice{
                case "1":
                    teamMemberChoosed = 0
                    memberChoosed = team[teamMemberChoosed!]
                case "2":
                    teamMemberChoosed = 1
                    memberChoosed = team[teamMemberChoosed!]
                case "3":
                    teamMemberChoosed = 2
                    memberChoosed = team[teamMemberChoosed!]
                default:
                    print("Vous devez choisir un numero de la liste")
                    teamMemberChoosed = nil
                }
            }
        }
        return memberChoosed!
        
    }
    
}
