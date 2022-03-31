class Personnage {
    
    var persoHealth: Int
    var persoDamage: Int
    var persoName: String
    init(persoName: String, persoHealth: Int, persoDamage: Int){
        self.persoName = persoName
        self.persoHealth = persoHealth
        self.persoDamage = persoDamage
    }
    func makeDamage(victim: Personnage, persoDamage: Int){
        victim.persoHealth -= persoDamage
    }
}

class Warrior: Personnage {
    
    init(persoName: String){
        let selfpersoName = persoName
        super.init(persoName: selfpersoName, persoHealth: 50, persoDamage: 30)
    }
}

class Magus: Personnage {
    
    init(persoName: String){
        let selfpersoName = persoName
        super.init(persoName: selfpersoName, persoHealth: 90, persoDamage: 30)
    }
    func healing(friend: Personnage){
        friend.persoHealth += 25
    }
}

class Colossus: Personnage {
    
    init(persoName: String){
        let selfpersoName = persoName
        super.init(persoName: selfpersoName, persoHealth: 40, persoDamage: 40)
    }
}

class Dwarf: Personnage {
    
    init(persoName: String){
        let selfpersoName = persoName
        super.init(persoName: selfpersoName, persoHealth: 30, persoDamage: 70)
    }
}

class Elf: Personnage {
    
    init(persoName: String){
        let selfpersoName = persoName
        super.init(persoName: selfpersoName, persoHealth: 50, persoDamage: 30)
    }
}

class Giant: Personnage {
    
    init(persoName: String){
        let selfpersoName = persoName
        super.init(persoName: selfpersoName, persoHealth: 50, persoDamage: 30)
    }
}
