import Darwin
class Game {
    
    let persoChoice = """
                                                                    1. Warrior : Points de vie 50 Dégats 30
                                                                    2. Magus :   Points de vie 90 Dégats 30
                                                                    3. Colossus : Points de vie 40 Dégats 40
                                                                    4. Dwarf : Point de vie 30 Dégats 70
                                                                    5. Elf : Point de vie 50 Dégats 30
                                                                    6. Giant : Point de vie 50 Dégats 50\n
    """
    
    func gamePresentation(){
        
    print("                                                         Hello, Bienvenue dans Mortal team combat\n")
    print("                                         Ce jeu se joue à 2, vous allez pouvoir , chacun votre tour, lancer des attaques\n")
    print("                     Vous allez devoir constituer chacun votre équipe de trois en choisissant parmis une liste de personnages et leur donner un nom\n")
    }
    
    func chooseProcess() -> [Personage]{
        
        var team: [Personage] = []
        if team.count == 0{
            print("                                                                 Joueur 1, à vous de commencer :\n")
            print(persoChoice)
        }
        while team.count < 6{
            if let choosedType = readLine(){
                if choosedType == "1" || choosedType == "2" || choosedType == "3" || choosedType == "4" || choosedType == "5" || choosedType == "6" {
                    let dictioPerso: [String: Personage] = ["1": Warrior(name: ""), "2": Magus(name: ""), "3": Colossus(name: ""), "4": Dwarf(name: ""), "5": Elf(name: ""), "6": Giant(name: "")]
                    if let choosedClass = dictioPerso[choosedType]{
                        let perso = choosedClass
                        print("Choisissez un nom pour votre personnage")
                        if var choosedName = readLine(){
                            
                            while choosedName.isEmpty{
                                print("le nom de votre personnage doit contenir au moins une lettre")
                                if let choosedName2 = readLine(){
                                    choosedName = choosedName2
                                }
                            }
                            if team.isEmpty == false{
                                for member in team{
                                    
                                    while member.name == choosedName{
                                        print("Ce nom est déja utilisé, veuillez en choisir un autre")
                                        if var choosedName2 = readLine(){
                                            while choosedName2.isEmpty{
                                                print("le nom de votre personnage doit contenir au moins une lettre")
                                                if let choosedName3 = readLine(){
                                                    choosedName2 = choosedName3
                                                }
                                            }
                                            choosedName = choosedName2
                                        }
                                    }
                                }
                            }
                            perso.name = choosedName
                            team.append(perso)
                        }
                    }
                    if team.count == 3{
                        print("                                                                     Joueur 2, c'est à vous :\n")
                        print(persoChoice)
                    }
                    if team.count == 1 || team.count == 4{
                        print("Veuillez choisir votre deuxième personnage")
                    }
                    else if team.count == 2 || team.count == 5{
                        print("Veuillez choisir votre troisième et dernier personnage")
                    }
                }
                else{
                    print("Veuillez choisir un chiffre entre 1 et 6")
                }
            }
        }
        return team
    }
    
    func start()/* -> ([Personnage], [Personnage])*/{
        
        gamePresentation()
        
        let team: [Personage] = chooseProcess()
        let team1 = Array(team[0...2])
        let team2 = Array(team[3...5])
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
//        return (team1, team2)
//        while team1.isEmpty != false || team2.isEmpty != false{
            print("Joueur 1 c'est à toi de jouer\n")
//            fight(myTeam: team1, opposingTeam: team2)
            print("Joueur 2 c'est à ton tour\n")
//            fight(myTeam: team2, opposingTeam: team1)
//        }
    }
    
    func fight(/*myTeam: [Personnage], opposingTeam: [Personnage]*/){
        // a effacer apres et remettre le parametre team dans la fonction fight, c'était juste pour eviter de repasser par la case choosedprocess. team: [Personnage]
        let perso1 = Magus(name: "maurice")
        let perso2 = Giant(name: "michel")
        let perso3 = Elf(name: "brian")
        let team1 = [perso1, perso2, perso3]
        
        let perso4 = Warrior(name: "francois")
        let perso5 = Giant(name: "rocky")
        let perso6 = Elf(name: "moustache")
        let team2 = [perso4, perso5, perso6]
        
        var memberChoosed: Personage
        var oppMemberChoosed: Personage
        var i = 1
        print("Quel joueur voulez vous envoyer au combat?\n")
        for member in team1{
            print("\(i). \(member.name)")
            i += 1
        }
        if var teamMemberChoice = readLine(){
            while teamMemberChoice != "1" && teamMemberChoice != "2" && teamMemberChoice != "3"{
                print("Veuillez choisir un des numéro de la liste\n")
                    if let teamMemberChoice2 = readLine(){
                        teamMemberChoice = teamMemberChoice2
                    }
            }
            if let teamNumberChoice = Int(teamMemberChoice){
                memberChoosed = team1[teamNumberChoice-1]
                if memberChoosed.type == .Magus{
                    print("""
                          Pour ce personnage, tu as deux choix :
                                      1. attaquer un adversaire
                                      2. soigner un co équipié
                          """)
                    if var actionChoosed = readLine(){
                        while actionChoosed != "1" && actionChoosed != "2"{
                            print("Veuillez choisir un des numéro de la liste\n")
                            if let actionChoosed2 = readLine(){
                                actionChoosed = actionChoosed2
                            }
                        }
                        if actionChoosed == "1"{
                            actionChoosed = "attack"
                            print("Maintenant tu dois choisir un personnage adverse")
                        }
                        else{
                            actionChoosed = "cure"
                            print("Choisis un personnage à soigner dans ton équipe")
                        }
                        i = 1
                        if actionChoosed == "attack"{
                            for member in team2{
                                print("\(i). \(member.name)")
                                i += 1
                            }
                            if var oppTeamMemberChoice = readLine(){
                                while oppTeamMemberChoice != "1" && oppTeamMemberChoice != "2" && oppTeamMemberChoice != "3"{
                                    print("Veuillez choisir un des numéro de la liste\n")
                                        if let oppTeamMemberChoice2 = readLine(){
                                            oppTeamMemberChoice = oppTeamMemberChoice2
                                        }
                                }
                                if let oppTeamMemberChoice = Int(oppTeamMemberChoice){
                                    oppMemberChoosed = team1[oppTeamMemberChoice-1]
                                    memberChoosed.makeDamage(victim: oppMemberChoosed)
                                    print("\(memberChoosed.name) a attaqué \(oppMemberChoosed.name)")
                                }
                            }
                        }
                        else if actionChoosed == "cure"{
                            for member in team1{
                                print("\(i). \(member.name)")
                                i += 1
                            }
                            if var oppTeamMemberChoice = readLine(){
                                while oppTeamMemberChoice != "1" && oppTeamMemberChoice != "2" && oppTeamMemberChoice != "3"{
                                    print("Veuillez choisir un des numéro de la liste\n")
                                        if let oppTeamMemberChoice2 = readLine(){
                                            oppTeamMemberChoice = oppTeamMemberChoice2
                                        }
                                }
                                if let oppTeamMemberChoice = Int(oppTeamMemberChoice){
                                    oppMemberChoosed = team1[oppTeamMemberChoice-1]
                                    memberChoosed.healing(friend: oppMemberChoosed)
                                    print("\(memberChoosed.name) a soigné \(oppMemberChoosed.name)")
                                }
                            }
                        }
                    }
                }
                else{
                    print("Maintenant tu dois choisir un personnage adverse")
                    i = 1
                    for member in team2{
                        print("\(i). \(member.name)")
                        i += 1
                    }
                    if var oppTeamMemberChoice = readLine(){
                        while oppTeamMemberChoice != "1" && oppTeamMemberChoice != "2" && oppTeamMemberChoice != "3"{
                            print("Veuillez choisir un des numéro de la liste\n")
                                if let oppTeamMemberChoice2 = readLine(){
                                    oppTeamMemberChoice = oppTeamMemberChoice2
                                }
                        }
                        if let oppTeamMemberChoice = Int(oppTeamMemberChoice){
                            oppMemberChoosed = team1[oppTeamMemberChoice-1]
                            memberChoosed.makeDamage(victim: oppMemberChoosed)
                            print("\(memberChoosed.name) a attaqué \(oppMemberChoosed.name)")
                        }
                    }
                }
            }
        }
    }
}
