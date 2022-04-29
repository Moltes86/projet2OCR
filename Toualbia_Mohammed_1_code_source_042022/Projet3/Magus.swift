class Magus: Personage {
    
    init(name: String){
        super.init(name: name, type: .Magus, health: 90, weapon: Weapon(name: "sceptre", damage: 30), dead: false)
    }
    override func healing(friend: Personage){
        friend.health += 25
    }
}
