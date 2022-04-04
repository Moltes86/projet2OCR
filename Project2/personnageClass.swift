class Personnage {
    
    var health: Int
    var damage: Int
    var name: String
    init(name: String, health: Int, damage: Int){
        self.name = name
        self.health = health
        self.damage = damage
    }
    func makeDamage(victim: Personnage){
        victim.health -= self.damage
    }
}
