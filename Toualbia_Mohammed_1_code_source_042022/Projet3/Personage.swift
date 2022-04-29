class Personage {
    
    enum Kind{
        case Warrior
        case Magus
        case Dwarf
    }
    var name: String
    var type: Kind
    var health: Int
    let weapon: Weapon
    var dead: Bool
    
    init(name: String, type: Personage.Kind, health: Int, weapon: Weapon, dead: Bool){
        self.name = name
        self.type = type
        self.health = health
        self.weapon = weapon
        self.dead = dead
    }
    func makeDamage(victim: Personage){
        victim.health -= self.weapon.damage
    }
    func healing(friend: Personage){}
}
