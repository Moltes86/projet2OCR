import Darwin

class NewGame {
    
    func gamePresentation(){
        
    print("                                                         Hello, Bienvenue dans Mortal team combat\n")
    print("                                         Ce jeu se joue à 2, vous allez pouvoir , chacun votre tour, lancer des attaques\n")
    print("                     Vous allez devoir constituer chacun votre équipe de trois en choisissant parmis une liste de personnages et leur donner un nom\n")
        
    }
    
//    let persoChoice = """
//                                                                    1. Warrior : Points de vie 50 Dégats 30
//                                                                    2. Magus :   Points de vie 90 Dégats 30
//                                                                    3. Colossus : Points de vie 40 Dégats 40
//                                                                    4. Dwarf : Point de vie 30 Dégats 70
//                                                                    5. Elf : Point de vie 50 Dégats 30
//                                                                    6. Giant : Point de vie 50 Dégats 50\n
//    """
    
//    func createPlayer() -> Player {
//
//        let Player = Player(team: teamBuilding())
//        return Player
//
//    }
    
//    func checkName(playerTeam: [Personage], choosedName: String) -> String{
//        
//        var checkedName = choosedName
//        for member in playerTeam{
//            print(checkedName)
//            while checkedName.isEmpty{
//                print("le nom de votre personnage doit contenir au moins une lettre")
//                if let choosedName2 = readLine(){
//                    while member.name == choosedName2{
//                        print("Ce nom est déja utilisé, veuillez en choisir un autre")
//                        if let choosedName3 = readLine(){
//                            checkedName = choosedName3
//                        }
//                    }
//                    checkedName = choosedName2
//                }
//            }
//        }
//        return checkedName
//    }
    
//    func teamBuilding() -> [Personage]{
//        
//        var team: [Personage] = []
//        print(persoChoice)
//        while team.count < 3{
//            if team.count == 0{
//                print("Veuillez choisir votre premier personnage")
//            }
//            else if team.count == 1{
//                print("Veuillez choisir votre deuxième personnage")
//            }
//            else if team.count == 2{
//                print("Veuillez choisir votre troisième personnage")
//            }
//            let perso = persoCreation(otherPlayerTeam: team)
//            team.append(perso)
//        }
//            
//        return team
//    }
    
//    func persoCreation(otherPlayerTeam: [Personage] = []) -> Personage{
//        
//        var perso: Personage?
//        
//        while perso == nil{
//            if let choosedType = readLine(){
//                switch choosedType{
//                case "1":
//                    perso = Warrior(name: "")
//                case "2":
//                    perso = Magus(name: "")
//                case "3":
//                    perso = Colossus(name: "")
//                case "4":
//                    perso = Dwarf(name: "")
//                case "5":
//                    perso = Elf(name: "")
//                case "6":
//                    perso = Giant(name: "")
//                default:
//                    print("Veuillez choisir un chiffre entre 1 et 6")
//                }
//            }
//        }
//        print("Choisissez un nom pour votre personnage")
//        if let choosedName = readLine(){
//            perso!.name = checkName(playerTeam: otherPlayerTeam, choosedName: choosedName)
//        }
//        return perso!
//    }
    
}
