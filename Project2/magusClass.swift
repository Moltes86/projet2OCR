class Magus: Personnage {
    
    init(name: String){
        super.init(name: name, type: "mage", health: 90, damage: 30,  weapon: "son sceptre")
    }
    func healing(friend: Personnage){
        friend.health += 25
    }
}
