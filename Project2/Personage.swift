class Personage {
    
    enum type{
        case Giant
        case Warrior
        case Magus
        case Colossus
        case Dwarf
        case Elf
    }
    var name: String
    var type = type.Giant
    var health: Int
    var damage: Int
    let weapon: String
    
    init(name: String, type: Personage.type, health: Int, damage: Int, weapon: String){
        self.name = name
        self.type = type
        self.health = health
        self.damage = damage
        self.weapon = weapon
    }
    func makeDamage(victim: Personage){
        victim.health -= self.damage
    }
    func healing(friend: Personage){}
}
