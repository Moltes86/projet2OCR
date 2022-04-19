import Darwin
class Player {
    
    let persoChoice = """
                                                                    1. Warrior : Points de vie 50 Dégats 30
                                                                    2. Magus :   Points de vie 90 Dégats 30
                                                                    3. Colossus : Points de vie 40 Dégats 40
                                                                    4. Dwarf : Point de vie 30 Dégats 70
                                                                    5. Elf : Point de vie 50 Dégats 30
                                                                    6. Giant : Point de vie 50 Dégats 50\n
    """
    
    var team: [Personage]
    var otherTeam: [Personage]
    let name: String
    
    init(team: [Personage] = [], otherTeam: [Personage] = [], name: String){
        
        self.team = team
        self.otherTeam = otherTeam
        self.name = name
        self.team = teamBuilding(name: self.name)
        
    }
    
    // ---------- This method build a team and return it on an array ----------
    
    func teamBuilding(name: String) -> [Personage]{
        
        let name = name
        var team: [Personage] = []
        print("                                                             \(name), c'est à vous\n\n")
        print(persoChoice)
        while team.count < 3{
            if team.count == 0{
                print("Veuillez choisir votre premier personnage")
            }
            else if team.count == 1{
                print("Veuillez choisir votre deuxième personnage")
            }
            else if team.count == 2{
                print("Veuillez choisir votre troisième personnage")
            }
            
            // ---------- We creat a new object depend class in the persoCreation method ----------
            
            let perso = persoCreation()
            
            // ---------- When personage created, he have a default name. Here, we add the real name ----------
            
            print("Choisissez un nom pour votre personnage")
            if let choosedName = readLine(){
                
                // ---------- This part is to check if the name is Already used in each team's player using checkName methode ----------
                
                let firstCheckedName = checkName(playerTeam: self.otherTeam , choosedName: choosedName)
                perso.name = checkName(playerTeam: team, choosedName: firstCheckedName)
            }
            
            // ---------- Finaly, the personage is added to the team's array ----------
            
            team.append(perso)
        }
            
        return team
    }
    
    // ---------- This method will create a new personage and return it ----------
    
    func persoCreation() -> Personage{
        
        var perso: Personage?
        
        while perso == nil{
            if let choosedType = readLine(){
                switch choosedType{
                case "1":
                    perso = Warrior(name: "")
                case "2":
                    perso = Magus(name: "")
                case "3":
                    perso = Colossus(name: "")
                case "4":
                    perso = Dwarf(name: "")
                case "5":
                    perso = Elf(name: "")
                case "6":
                    perso = Giant(name: "")
                default:
                    print("Veuillez choisir un chiffre entre 1 et 6")
                }
            }
        }
        return perso!
    }
    
    // ---------- This method check the name on the team passed on parameter and return a checked name ----------
    
    func checkName(playerTeam: [Personage], choosedName: String) -> String{
        
        var checkedName = choosedName
        if playerTeam.isEmpty{
            while checkedName.isEmpty{
                print("le nom de votre personnage doit contenir au moins une lettre")
                if let checkedName2 = readLine(){
                    checkedName = checkedName2
                }
            }
        }
        else{
            for member in playerTeam{
                while member.name == checkedName{
                    print("Ce nom est déja utilisé, veuillez en choisir un autre")
                    if let checkedName2 = readLine(){
                        checkedName = checkedName2
                    }
                }
            }
        }
        return checkedName
    }
}
