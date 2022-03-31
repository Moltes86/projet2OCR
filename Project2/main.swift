print("Hello, Bienvenue dans Mortal team combat")
print("Ce jeu se joue à 2, vous allez pouvoir , chacun votre tour, lancer des attaques")
print("Vous allez devoir constituer chacun votre équipe de trois en choisissant parmis une liste de personnages et leur donner un nom")
print("Joueur 1, à vous de commencer :")
let persoChoice = """
1. Warrior : Points de vie 50 Dégats 30
2. Magus :   Points de vie 90 Dégats 30
3. Colossus : Points de vie 40 Dégats 40
4. Dwarf : Point de vie 30 Dégats 70
5. Elf : Point de vie 50 Dégats 30
6. Giant : Point de vie 50 Dégats 50
"""

print(persoChoice)
var team1: [Personnage] = chooseprocess()

print("Joueur 2, c'est à vous :")

print(persoChoice)
var team2: [Personnage] = chooseprocess()

//for teamMember in team1{
//    print(teamMember.persoName)
//}

print(team1)
print(team2)
