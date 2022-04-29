import Darwin
class Player {
    
    let persoChoice = """
                                                                    1. Warrior : Points de vie 50 Dégats 30
                                                                    2. Magus :   Points de vie 90 Dégats 30
                                                                    3. Dwarf : Point de vie 30 Dégats 70\n
    """
    
    var team: [Personage]
    var otherTeam: [Personage]
    let name: String
    
    init(team: [Personage] = [], otherTeam: [Personage] = [], name: String){
        
        self.team = team
        self.otherTeam = otherTeam
        self.name = name
        self.team = teamBuilding()
        
    }
    
    // ---------- This method build a team and return it in array ----------
    
    func teamBuilding() -> [Personage]{
        
        var team: [Personage] = []
        print("                                                             \(self.name), c'est à vous\n\n")
        print(persoChoice)
        
        // ---------- we do this as long as the team is not completed ----------
        
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
            
            // ---------- We create a new object depend class in the persoCreation method ----------
            
            let perso = persoCreation()
            
            // ---------- When personage created, he have a default name. Here, we add the name choosed ----------
            
            print("Choisissez un nom pour votre personnage")
            if let choosedName = readLine(){
                
                // ---------- This part is to check if the name is already used in one of the both teams using checkName method ----------
                
                let firstCheckedName = checkName(playerTeam: self.otherTeam, choosedName: choosedName)
                perso.name = checkName(playerTeam: team, choosedName: firstCheckedName)
            }
            
            // ---------- Finaly, the personage is added to the team's array ----------
            
            team.append(perso)
        }
        return team
    }
    
    // ---------- This method will choose a type of personage and return it ----------
    
    private func persoCreation() -> Personage{
        
        var perso: Personage?
        
        while perso == nil{
            if let choosedType = readLine(){
                switch choosedType{
                case "1":
                    perso = Warrior(name: "")
                case "2":
                    perso = Magus(name: "")
                case "3":
                    perso = Dwarf(name: "")
                default:
                    print("Veuillez choisir un chiffre entre 1 et 3")
                }
            }
        }
        return perso!
    }
    
    // ---------- This method check the name on the team passed on parameter and return a checked name ----------
    
    private func checkName(playerTeam: [Personage], choosedName: String) -> String{
        
        var checkedName = choosedName
        while checkedName.isEmpty{
            print("le nom de votre personnage doit contenir au moins un caractère")
            if let checkedName2 = readLine(){
                checkedName = checkedName2
            }
        }
        while playerTeam.contains(where: {$0.name.uppercased() == checkedName.uppercased()}){
            print("Ce nom est déja utilisé, veuillez en choisir un autre")
            if let checkedName2 = readLine(){
                checkedName = checkedName2
            }
        }
        return checkedName
    }
}
