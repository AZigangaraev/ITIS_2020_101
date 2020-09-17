//KAMALIEV EMIL 11-901
import UIKit

class Team {
    
    var name: String;
    var p1: Player;
    var p2: Player;
    var p3: Player;
    var p4: Player;
    
    init(name: String,p1: Player,p2: Player,p3: Player,p4: Player) {
        self.name = name;
        self.p1 = p1;
        self.p2 = p2;
        self.p3 = p3;
        self.p4 = p4;
    }
    
    func battleRoar(){
        print(self.name + " WILL WIN!!! \n");
    }
    
    func winBattleRoar() {
        print(self.name + " IS THE BEST TEAM!!! \n")
    }
    
    func checkIfTeamCanFight() -> Bool{
        if (p1.hp > 0 && p2.hp > 0 && p3.hp > 0 && p4.hp > 0) {
            return true;
        } else {
            return false
            
        }
    }
    
    func chooseOnePlayerRandomly() -> Player {
        
        let randomizing:Int = Int.random(in: 1...4)
        
        switch randomizing {
        case 1:
            return p1;
        case 2:
            return p2;
        case 3:
            return p3;
        case 4:
            return p4;
        default:
            return p1;
        }
        
        
    }
    
    
        
        
    }
    


class Player {
    var name: String;
    var damage: Int;
    var hp: Int;
    var id: Int;
    
    init(name: String,damage: Int,hp: Int,id: Int) {
        self.name = name;
        self.damage = damage;
        self.hp = hp;
        self.id = id;
    }
    
    func damageEnemy(enemy: Player){
       
        if (enemy.hp > 0) {
            enemy.hp = enemy.hp - damage;
        }
        else {
            print("I wouldn't hit dead enemy \n")
        }
    }
    
    func catchingHealthHealer(){
        let randomizingOfHealthHealer: Int = Int.random(in: 1...2)
    
        if randomizingOfHealthHealer == 1 {
            self.hp += 1;
        }
        
        
        
        
        
    }
    
    func catchingDamageUpgrading(){
        let randomizingOfDamageUpgrading: Int = Int.random(in: 1...2)
    
        if randomizingOfDamageUpgrading == 1 {
            self.damage += 1;
        }
        
        
        
        
        
    }
    
    
}

//team lost the game if even one player in team is dead;

class Game {
    
    var team1: Team;
    var team2: Team;
    
    init(team1: Team,team2: Team) {
        self.team1 = team1;
        self.team2 = team2;
        
    }
    
    
    
    func roundBetweenTwoTeams() {
        
        while(team1.checkIfTeamCanFight() && team2.checkIfTeamCanFight()) {
            
            let random: Int = Int.random(in: 1...2);
            var numberOfRound:Int = 1;
            
            
            if(random == 1) {
                
                
                let tempPlayer = team1.chooseOnePlayerRandomly();
                print("\n Player \(tempPlayer.name) has catched health healing! \n")
                tempPlayer.catchingHealthHealer()
                
                let temp2Player = team1.chooseOnePlayerRandomly();
                print("\n Player \(temp2Player.name) has catched damage bonus! \n")
                temp2Player.catchingDamageUpgrading();
                
                team1.p1.damageEnemy(enemy: team2.p1)
                print(" \(team1.p1.name)  hits  \(team2.p1.name),his hp is \(team2.p1.hp)")
                team1.p2.damageEnemy(enemy: team2.p2)
                print(" \(team1.p2.name)  hits  \(team2.p2.name),his hp is \(team2.p2.hp)")
                team1.p3.damageEnemy(enemy: team2.p3)
                print(" \(team1.p3.name)  hits  \(team2.p3.name),his hp is \(team2.p3.hp)")
                team1.p4.damageEnemy(enemy: team2.p4)
                print(" \(team1.p4.name)  hits  \(team2.p4.name),his hp is \(team2.p4.hp)")
                numberOfRound += 1;
            }
            
            if(random == 2) {
                
                
                team2.chooseOnePlayerRandomly().catchingHealthHealer();
                team2.chooseOnePlayerRandomly().catchingDamageUpgrading();
                
                team2.p1.damageEnemy(enemy: team1.p1)
                print(" \(team2.p1.name)  hits  \(team1.p1.name),his hp is \(team1.p1.hp)")
                team2.p2.damageEnemy(enemy: team1.p2)
                print(" \(team2.p2.name)  hits  \(team1.p2.name),his hp is \(team1.p2.hp)")
                team2.p3.damageEnemy(enemy: team1.p3)
                print(" \(team2.p3.name)  hits  \(team1.p3.name),his hp is \(team1.p3.hp)")
                team2.p4.damageEnemy(enemy: team1.p4)
                print(" \(team2.p4.name)  hits  \(team1.p4.name),his hp is \(team1.p4.hp)")
                numberOfRound += 1;
            
            }
            
        }
    
            
            if(team1.p1.hp <= 0 || team1.p2.hp <= 0 || team1.p3.hp <= 0 || team1.p4.hp <= 0) {
               // SecondTeamWon = true;
                print("\n Second team won! \n")
            }else if(team2.p1.hp <= 0 || team2.p2.hp <= 0 || team2.p3.hp <= 0 || team2.p4.hp <= 0) {
                //FirstTeamWon = true;
                print("\n First team won! \n")
            }
        
    }
            
            
            
            
    
}

//initialising of players & teams
var pfirst1: Player = Player.init(name: "Alex", damage: 1, hp: 5, id: 1)
var pfirst2: Player = Player.init(name: "Sasha", damage: 2, hp: 4, id: 2)
var pfirst3: Player = Player.init(name: "Oleg", damage: 1, hp: 5, id: 3)
var pfirst4: Player = Player.init(name: "Danya", damage: 2, hp: 4, id: 4)

var psecond1: Player = Player.init(name: "Vasya", damage: 1, hp: 5, id: 5)
var psecond2: Player = Player.init(name: "Petya", damage: 2, hp: 4, id: 6)
var psecond3: Player = Player.init(name: "Dima", damage: 1, hp: 5, id: 7)
var psecond4: Player = Player.init(name: "Kirill", damage: 2, hp: 4, id: 8)

var team1: Team = Team.init(name: "FirstTeam", p1: pfirst1, p2: pfirst2, p3: pfirst3, p4: pfirst4)
var team2: Team = Team.init(name: "SecondTeam", p1: psecond1, p2: psecond2, p3: psecond3,p4: psecond4)



//Battle has started!

print("First team,show us your battle roar!  \n")
team1.battleRoar();
print("Second team,now it's your's turn!  \n")
team2.battleRoar();

//Battleground

var game: Game = Game.init(team1: team1, team2: team2)
game.roundBetweenTwoTeams()

print("Winners,show us your Winning Battle Roar! \n")
print("WE ARE THE BEST!!! \n")






