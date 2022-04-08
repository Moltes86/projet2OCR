class Personnage {
    
    var name: String
    var type: String
    var health: Int
    var damage: Int
    let weapon: String
    
    init(name: String, type: String, health: Int, damage: Int, weapon: String){
        self.name = name
        self.type = type
        self.health = health
        self.damage = damage
        self.weapon = weapon
    }
    func makeDamage(victim: Personnage){
        victim.health -= self.damage
    }
    func healing(friend: Personnage){}
}
