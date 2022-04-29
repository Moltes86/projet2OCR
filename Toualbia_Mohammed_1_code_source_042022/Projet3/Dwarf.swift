class Dwarf: Personage {
    
    init(name: String){
        super.init(name: name, type: .Dwarf, health: 30, weapon: Weapon(name: "massue", damage: 70), dead: false)
    }
}
