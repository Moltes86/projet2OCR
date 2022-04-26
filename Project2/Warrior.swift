class Warrior: Personage {
    
    init(name: String){
        super.init(name: name, type: .Warrior, health: 50, weapon: Weapon(name: "épée", damage: 30), dead: false)
    }
}
