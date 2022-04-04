class Magus: Personnage {
    
    init(name: String){
        super.init(name: name, health: 90, damage: 30)
    }
    func healing(friend: Personnage){
        friend.health += 25
    }
}
