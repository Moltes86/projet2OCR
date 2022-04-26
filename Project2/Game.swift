import Darwin
extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
class Game {
    
    init(){
        
        gamePresentation()
    }
    
    // ---------- Little game's presentation ----------
    
    func gamePresentation() {
        
        print("                                                         Hello, Bienvenue dans Mortal team combat\n")
        print("                                         Ce jeu se joue à 2, vous allez pouvoir , chacun votre tour, lancer des attaques\n")
        print("                     Vous allez devoir constituer chacun votre équipe de trois en choisissant parmis une liste de personnages et leur donner un nom\n")
        
    }
    
    // ---------- Present each team with all properties ----------
    
    func teamPresentation(player: Player){
        
            print("""
                                                                                        \(player.name) :\n
            """)
        for member in player.team{
                if member.dead == true {
                    print("""
                          +++ MORT +++ \(member.name) était un \(member.type) qui pouvait infliger \(member.weapon.damage) points de dégât avec \(member.weapon.name) et à qui il ne reste plus de points de vie.\n
                          
                          """)
                    
                }
                else{
                    print("""
                    \(member.name) est un \(member.type) qui peut infliger \(member.weapon.damage) points de dégât avec \(member.weapon.name) et qui a \(member.health) points de vie.\n
                    """)
                }
            }
        
    }
    
    // ---------- Start game ----------
    
    func start(){
        
        // ---------- In this method, we start by creating two personage ----------
        
        let Player1 = Player(name: "Joueur 1")
        let Player2 = Player(otherTeam: Player1.team, name: "Joueur 2")
        var turnNb = 0
        var myWinner: Player?
        print("""
                                                                    Vos équipes se compose de la manière suivante :
        """)
        teamPresentation(player: Player1)
        teamPresentation(player: Player2)
        
        print("                                                Les équipes sont constituées, le jeu peut maintenant commencer\n")
        
        while myWinner == nil{
            turnNb += 1
            print("Joueur 1 c'est à vous de jouer\n")
            fight(myTeam: Player1.team, opposingTeam: &Player2.team)
            
            // ---------- When team2 is empty, he no longer has a choice, the game is over ----------
            
            if Player2.team.filter({$0.dead == false}).count == 0{
                myWinner = Player1
            }
            else{
                print("Joueur 2 c'est à votre tour\n")
                fight(myTeam: Player2.team, opposingTeam: &Player1.team)
                if Player1.team.filter({$0.dead == false}).count == 0{
                    myWinner = Player2
                }
            }
        }
        
        // ---------- when a team has no more members, the game is over ----------
        
        if let myWinner = myWinner {
            print("""
                    La partie est terminée, il a fallu \(turnNb) tours
                    Le gagnant est le \(myWinner.name)
            """)
        }
        
        teamPresentation(player: Player1)
        teamPresentation(player: Player2)
        
    }
    
    // ---------- This method take two teams in parameter for the fight and updates every member and team ----------
    
    private func fight(myTeam: [Personage], opposingTeam: inout [Personage]){
        
        print("Quel joueur voulez vous envoyer au combat?\n")
        
        // ---------- To choose which member team make action, we need to call the chooseMemberTeam method ----------
        
        let memberChoosed = chooseMemberTeam(team: myTeam.filter({$0.dead == false}))
        
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
                    let secondMemberChoosed = chooseMemberTeam(team: myTeam.filter({$0.dead == false}))
                    memberChoosed.healing(friend: secondMemberChoosed)
                    print("\(memberChoosed.name) a soigné \(secondMemberChoosed.name)\n")
                    
                }
            }
        }
        print("Quel joueur voulez vous attaquer?\n")
        let oppMemberChoosed = chooseMemberTeam(team: opposingTeam.filter({$0.dead == false}))
        memberChoosed.makeDamage(victim: oppMemberChoosed)
        print("\(memberChoosed.name) a attaqué \(oppMemberChoosed.name)\n")
        
        // ---------- When health is to zero, member die and automatically have his "dead" property on true ----------
        
        if oppMemberChoosed.health <= 0{
            
            // ---------- We find his index whith his name property ----------
            
            if let indexMember = opposingTeam.firstIndex(where: {$0.name == oppMemberChoosed.name}) {
                opposingTeam[indexMember].dead = true
            }
        }
        
    }
    
    // ----------- chooseMemberTeam take team on parameter and return the personage choosed ----------
    
    private func chooseMemberTeam(team: [Personage]) -> Personage{
        
        // ----------- first, it lists the member team who are not dead ----------
        
        var i = 1
        for member in team{
            print("\(i). \(member.name) ( \(member.type), \(member.health) points de vie et \(member.weapon.damage) dommage causable )")
            i += 1
        }
        
        // ---------- Then, we can choose a member -----------
        
        while true{
            if let choice = readLine(){
                if !choice.description.isInt/* != true*/{
                    print("Vous devez choisir un numero de la liste")
                }
                else{
                    if let choiceInt = Int(choice){
                        if !(choiceInt <= team.count) {
                            print("Vous devez choisir un numero de la liste")
                        } else{
                            switch choiceInt {
                            case 1:
                                return team[0]
                            case 2:
                                return team[1]
                            case 3:
                                return team[2]
                            default:
                                print("Vous devez choisir un numéro de la liste")
                            }
                        }
                    }
                }
            }
        }
    }
    
}
