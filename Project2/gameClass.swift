import Darwin
class game {
    
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
    
    func chooseprocess() -> [Personnage]{
        
        var team: [Personnage] = []
        if team.count == 0{
            print("                                                                 Joueur 1, à vous de commencer :\n")
            print(persoChoice)
        }
        while team.count < 6{
            if let choosedType = readLine(){
                if choosedType == "1" || choosedType == "2" || choosedType == "3" || choosedType == "4" || choosedType == "5" || choosedType == "6" {
                    let dictioPerso: [String: Personnage] = ["1": Warrior(name: ""), "2": Magus(name: ""), "3": Colossus(name: ""), "4": Dwarf(name: ""), "5": Elf(name: ""), "6": Giant(name: "")]
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
        
        let team: [Personnage] = chooseprocess()
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
//            fight(team: team1)
            print("Joueur 2 c'est à ton tour\n")
//            fight(team: team2)
//        }
    }
    
    func fight(/*team: [Personnage]*/){
        // a effacer apres et remettre le parametre team dans la fonction fight, c'était juste pour eviter de repasser par la case choosedprocess. team: [Personnage]
        let perso1 = Warrior(name: "maurice")
        let perso2 = Giant(name: "michel")
        let perso3 = Elf(name: "brian")
        let team = [perso1, perso2, perso3]
        var memberChoosed: Personnage
//        var enemyChoosed: Personnage
        print("Quel joueur voulez vous envoyer au combat?\n")
        var i = 1
        for member in team{
            print("\(i). \(member.name)")
            i += 1
        }
        if var teamMemberChoice = readLine(){
            while teamMemberChoice != "1" || teamMemberChoice != "2" || teamMemberChoice != "3"{
                print("Veuillez choisir un des numéro de la liste\n")
                    if let teamMemberChoice2 = readLine(){
                        teamMemberChoice = teamMemberChoice2
                    }
            }
            if let teamNumberChoice = Int(teamMemberChoice){
                memberChoosed = team[teamNumberChoice-1]
                print(memberChoosed)
            }
//                for member in team{
//                    while member.name != teamMemberChoice{
//                        print(member.name, teamMemberChoice)
//                        print("Veuillez choisir un nom dans la liste\n")
//                        if let teamMemberChoice2 = readLine(){
//                            teamMemberChoice = teamMemberChoice2
//                        }
//                    }
//                    memberChoosed = member
//                    break
//                }
        }
        
        
//        if memberChoosed.type == "mage"{
//            print("Avec ce personnage, vous avez deux possibilitées")
//            print("""
//                                        1. Attaquer
//                                        2. Soigner
//""")
//        }
//        else{
//
//        }
    }
}
