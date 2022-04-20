class Magus: Personage {
    
    init(name: String){
        super.init(name: name, type: .Magus, health: 90, damage: 30,  weapon: "son sceptre", dead: false)
    }
    override func healing(friend: Personage){
        friend.health += 25
    }
}
