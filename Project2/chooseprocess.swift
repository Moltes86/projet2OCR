func chooseprocess() -> [Personnage]{
    var team: [Personnage] = []
    while team.count < 3{
        if let persoType = readLine(){
            if persoType == "1" || persoType == "2" || persoType == "3" || persoType == "4" || persoType == "5" || persoType == "6" {
                print("Choisissez un nom pour votre personnage")
                if let choosedName = readLine(){
                    let persooName = choosedName
                    switch persoType{
                    case "1":
                        let perso = Warrior(persoName: persooName)
                        team.append(perso)
                    case "2":
                        let perso = Magus(persoName: persooName)
                        team.append(perso)
                    case "3":
                        let perso = Colossus(persoName: persooName)
                        team.append(perso)
                    case "4":
                        let perso = Dwarf(persoName: persooName)
                        team.append(perso)
                    case "5":
                        let perso = Elf(persoName: persooName)
                        team.append(perso)
                    case "6":
                        let perso = Giant(persoName: persooName)
                        team.append(perso)
                    default:
                        print("ok")
                    }
                    if team.count == 1{
                        print("Veuillez choisir votre deuxième personnage")
                    }
                    else if team.count == 2{
                        print("Veuillez choisir votre troisième et dernier personnage")
                    }
                }
    //            let dictioPerso: [String: String] = ["1": "Warrior", "2": "Magus", "3": "Colossus", "4": "Dwarf", "5": "Elf", "6": "Giant"]
    //            if let typeOfPerso = dictioPerso[persoType]{
    //                var teamMember = typeOfPerso(persoName: persooName)
    //            }
            }
            else{
                print("Veuillez choisir un chiffre entre 1 et 6")
            }
        }
    }
    return team
}
