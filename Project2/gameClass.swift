class game {
    
    let persoChoice = """
    1. Warrior : Points de vie 50 Dégats 30
    2. Magus :   Points de vie 90 Dégats 30
    3. Colossus : Points de vie 40 Dégats 40
    4. Dwarf : Point de vie 30 Dégats 70
    5. Elf : Point de vie 50 Dégats 30
    6. Giant : Point de vie 50 Dégats 50
    """
    
    func chooseprocess() -> [Personnage]{
        
        var team: [Personnage] = []
        if team.count == 0{
            print("Joueur 1, à vous de commencer :")
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
                            if team.isEmpty == false{
                                for member in team{
                                    while member.name == choosedName{
                                        print("Ce nom est déja utilisé, veuillez en choisir un autre")
                                        if let choosedName2 = readLine(){
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
                        print("Joueur 2, c'est à vous :")
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
    
    func gamePresentation(){
        
    print("Hello, Bienvenue dans Mortal team combat")
    print("Ce jeu se joue à 2, vous allez pouvoir , chacun votre tour, lancer des attaques")
    print("Vous allez devoir constituer chacun votre équipe de trois en choisissant parmis une liste de personnages et leur donner un nom")
    }
    
    func start() -> [Personnage]{
        
        let team: [Personnage] = chooseprocess()
        
        return (team)
    }
}
