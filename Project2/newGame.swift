import Darwin

class NewGame {
    
    init(){
        gamePresentation()
    }
    
    // ---------- Little game presentation's ----------
    
    func gamePresentation(){
        
    print("                                                         Hello, Bienvenue dans Mortal team combat\n")
    print("                                         Ce jeu se joue à 2, vous allez pouvoir , chacun votre tour, lancer des attaques\n")
    print("                     Vous allez devoir constituer chacun votre équipe de trois en choisissant parmis une liste de personnages et leur donner un nom\n")
        
    }
    
    // ---------- Present each team with all properties ----------
    
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
    
    // ---------- Start game with two teams in parameters ----------
    
    func start(team1: inout [Personage], team2: inout [Personage]){
        
        var turnNb = 0
        var winner = ""
        print("""
                                                                    Vos équipes se compose de la manière suivante :
""")
        teamPresentation(team: team1, i: "1")
        teamPresentation(team: team2, i: "2")
        
        print("                                                Les équipes sont constituées, le jeu peut maintenant commencer\n")
        
        while team1.count > 0 && team2.count > 0{
            turnNb += 1
            print("Joueur 1 c'est à vous de jouer\n")
            fight(myTeam: team1, opposingTeam: &team2)
            
            // ---------- When team2 is empty, he no longer has a choice, the game is over ----------
            
            if team2.count == 0{
                continue
            }
            else{
                print("Joueur 2 c'est à votre tour\n")
                fight(myTeam: team2, opposingTeam: &team1)
            }
        }
        
        if team1.isEmpty{
            winner = "Joueur 2"
        }
        else if team2.isEmpty{
            winner = "Joueur 1"
        }
        
        // ---------- when a team has no more members, the game is over ----------
        
        print("""
                La partie est terminée, il a fallu \(turnNb) tours
                Le gagnant est le \(winner)
        """)
        
        teamPresentation(team: team1, i: "1")
        teamPresentation(team: team2, i: "2")
        
    }
    
    // ---------- This method take two  teams parameter for the fight and updates every member and team ----------
    
    func fight(myTeam: [Personage], opposingTeam: inout [Personage]){
        
        print("Quel joueur voulez vous envoyer au combat?\n")
        
        // ---------- To choose which member team make action, we need to call the chooseMemberTeam method ----------
        
        let memberChoosed = chooseMemberTeam(team: myTeam)
        print(memberChoosed.type)
        
        if memberChoosed.type == .Magus{
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
        
        // ---------- When health is to zero, member die and automaticly remove from the team array ----------
        if oppMemberChoosed.health <= 0{
            
            // ---------- We find his index whith his name propertie ----------
            
            let indexMember = opposingTeam.firstIndex(where: {$0.name == oppMemberChoosed.name})
            opposingTeam.remove(at: indexMember!)
        }
        
    }
    
    func chooseMemberTeam(team: [Personage]) -> Personage{ // ----------- chooseMemberTeam return the personage ----------
        
        var memberChoosed: Personage?
        
        // ----------- first, it lists the member team ----------
        
        var i = 1
        for member in team{
            print("\(i). \(member.name) ( \(member.type), \(member.health) points de vie et \(member.damage) dommage causable )")
            i += 1
        }
        
        // ---------- Then, we can choose only the member that exist -----------
        
        var teamMemberChoosed: Int?
        while teamMemberChoosed == nil{
            if let teamMemberChoice = readLine(){
                switch teamMemberChoice{
                case "1":
                    teamMemberChoosed = 0
                    memberChoosed = team[teamMemberChoosed!]
                case "2":
                    if team.count <= 1{
                        print("Vous devez choisir un numero de la liste")
                        teamMemberChoosed = nil
                    }
                    else{
                        teamMemberChoosed = 1
                        memberChoosed = team[teamMemberChoosed!]
                    }
                case "3":
                    if team.count <= 2{
                        print("Vous devez choisir un numero de la liste")
                        teamMemberChoosed = nil
                    }
                    else{
                        teamMemberChoosed = 2
                        memberChoosed = team[teamMemberChoosed!]
                    }
                default:
                    print("Vous devez choisir un numero de la liste")
                    teamMemberChoosed = nil
                }
            }
        }
        return memberChoosed!
        
    }
    
}
