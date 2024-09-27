//UINavigatioonViewController

//  BullsEyeGameManaager.swift
//  BullsEye
//
//  Created by Irina Zakhvatkina on 18/09/24.
//playerNum

import Foundation

class BullsEyeGameManaager{
    var guessingNumber: Int
    var score: Int
    var round: Int
    
    
    init() {
        self.guessingNumber = Int.random(in: 1...100)
        self.score = 0
        self.round = 1
    }
    
    func didWinTheGame(){
        guessingNumber = Int.random(in: 1...100)
        score += 100
        round += 1
    }
    
    func didLoseTheGame(){
        guessingNumber = Int.random(in: 1...100)
        score = 0
        round = 1
    }
    
    
}
