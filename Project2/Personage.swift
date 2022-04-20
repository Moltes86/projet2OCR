class Personage {
    
    enum Kind{
        case Giant
        case Warrior
        case Magus
        case Colossus
        case Dwarf
        case Elf
    }
    var name: String
    var type: Kind
    var health: Int
    var damage: Int
    let weapon: String
    var dead: Bool
    
    init(name: String, type: Personage.Kind, health: Int, damage: Int, weapon: String, dead: Bool){
        self.name = name
        self.type = type
        self.health = health
        self.damage = damage
        self.weapon = weapon
        self.dead = dead
    }
    func makeDamage(victim: Personage){
        victim.health -= self.damage
    }
    func healing(friend: Personage){}
}
