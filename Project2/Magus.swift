class Magus: Personage {
    
    init(name: String){
        super.init(name: name, type: .Magus, health: 90, damage: 30,  weapon: "son sceptre")
    }
    override func healing(friend: Personage){
        friend.health += 25
    }
}
