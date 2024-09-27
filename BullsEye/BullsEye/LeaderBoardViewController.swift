//
//  LeaderBoardViewController.swift
//  BullsEye
//
//  Created by Irina Zakhvatkina on 20/09/24.
//

import UIKit
import SnapKit

class LeaderBoardViewController: UIViewController {
    let gameManager = BullsEyeGameManaager()

    let menuBackButton = UIButton()
    let titleLabel = UILabel()
    let playerLabel = UILabel()
    let scoreLabel = UILabel()
    let roundsLabel = UILabel()

    let firstCircleView = UIView()
    let secondCircleView = UIView()
    let thirdCircleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Color")
        
        view.addSubview(menuBackButton)
        view.addSubview(titleLabel)
        view.addSubview(playerLabel)
        view.addSubview(scoreLabel)
        view.addSubview(roundsLabel)
        
//        circle
        view.addSubview(firstCircleView)
        view.addSubview(secondCircleView)
        view.addSubview(thirdCircleView)
        setupCircleView()
 
//    table1
        configureLabels()
        configureStack()
        view.addSubview(firstStack)
        firstStack.addArrangedSubview(place)
        firstStack.addArrangedSubview(playerName)
        firstStack.addArrangedSubview(score)
        firstStack.addArrangedSubview(round)
        
//    table2
        configureLabels2()
        configureStack2()
        view.addSubview(secondStack)
        secondStack.addArrangedSubview(place2)
        secondStack.addArrangedSubview(playerName2)
        secondStack.addArrangedSubview(score2)
        secondStack.addArrangedSubview(round2)
        
//    table2
        configureLabels3()
        configureStack3()
        view.addSubview(thirdStack)
        thirdStack.addArrangedSubview(place3)
        thirdStack.addArrangedSubview(playerName3)
        thirdStack.addArrangedSubview(score3)
        thirdStack.addArrangedSubview(round3)
        
        setupMenuBackButton()
        setupTitleLable()
        setupPlayerLabel()

        makeConstraints()
    }
    
//    circle
  
    
    func setupCircleView(){
        firstCircleView.layer.borderWidth = 2
        firstCircleView.layer.borderColor = UIColor(red: 0.82, green: 0.89, blue: 0.98, alpha: 1.00).cgColor
        firstCircleView.layer.cornerRadius = 28
        
        secondCircleView.layer.borderWidth = 2
        secondCircleView.layer.borderColor = UIColor(red: 0.82, green: 0.89, blue: 0.98, alpha: 1.00).cgColor
        secondCircleView.layer.cornerRadius = 28
        
        thirdCircleView.layer.borderWidth = 2
        thirdCircleView.layer.borderColor = UIColor(red: 0.82, green: 0.89, blue: 0.98, alpha: 1.00).cgColor
        thirdCircleView.layer.cornerRadius = 28
    }
    
//table1
    var place = UILabel()
    var playerName = UILabel()
    var score = UILabel()
    var round = UILabel()
    
    func configureLabels() {
        place.text = "1"
        place.backgroundColor = .clear
        playerName.text = "Dog"
        playerName.backgroundColor = .clear
        score.text = "\(gameManager.score)"
        score.backgroundColor = .clear
        round.text = "\(gameManager.round)"
        round.backgroundColor = .clear
    }
    
    let firstStack = UIStackView()
    
    func configureStack() {
        firstStack.axis = .horizontal
        firstStack.distribution = .equalSpacing
        firstStack.alignment = .center
        firstStack.layer.borderWidth = 2
        firstStack.layer.borderColor = UIColor(red: 0.82, green: 0.89, blue: 0.98, alpha: 1.00).cgColor
        firstStack.layer.cornerRadius = 28
        firstStack.isLayoutMarginsRelativeArrangement = true
    }
    
//table2
    var place2 = UILabel()
    var playerName2 = UILabel()
    var score2 = UILabel()
    var round2 = UILabel()
    
    func configureLabels2() {
        place2.text = "2"
        place2.layer.borderWidth = 2
        place2.layer.borderColor = UIColor(red: 0.82, green: 0.89, blue: 0.98, alpha: 1.00).cgColor
        place2.layer.cornerRadius = 100
        place2.backgroundColor = .clear

        playerName2.text = "Dog"
        playerName2.backgroundColor = .clear
        score2.text = "\(gameManager.score)"
        score2.backgroundColor = .clear
        round2.text = "\(gameManager.round)"
        round2.backgroundColor = .clear
    }
    
    let secondStack = UIStackView()
    
    func configureStack2() {
        secondStack.axis = .horizontal
        secondStack.distribution = .equalSpacing
        secondStack.alignment = .center
        secondStack.layer.borderWidth = 2
        secondStack.layer.borderColor = UIColor(red: 0.82, green: 0.89, blue: 0.98, alpha: 1.00).cgColor
        secondStack.layer.cornerRadius = 28
        secondStack.isLayoutMarginsRelativeArrangement = true
    }
    
    //table3
    var place3 = UILabel()
    var playerName3 = UILabel()
    var score3 = UILabel()
    var round3 = UILabel()

    func configureLabels3() {
        place3.text = "3"
        place3.backgroundColor = .clear
        place3.layer.borderWidth = 2
        place3.layer.borderColor = UIColor(red: 0.82, green: 0.89, blue: 0.98, alpha: 1.00).cgColor
        place3.layer.cornerRadius = 100

        playerName3.text = "Dog"
        playerName3.backgroundColor = .clear
        score3.text = "\(gameManager.score)"
        score3.backgroundColor = .clear
        round3.text = "\(gameManager.round)"
        round3.backgroundColor = .clear
    }

    let thirdStack = UIStackView()

    func configureStack3() {
        thirdStack.axis = .horizontal
        thirdStack.distribution = .equalSpacing
        thirdStack.alignment = .center
        thirdStack.layer.borderWidth = 2
        thirdStack.layer.borderColor = UIColor(red: 0.82, green: 0.89, blue: 0.98, alpha: 1.00).cgColor
        thirdStack.layer.cornerRadius = 28
        thirdStack.isLayoutMarginsRelativeArrangement = true
    }
        
    
//  ButtonBack on MainViewController
    func setupMenuBackButton(){
        menuBackButton.setImage(UIImage(named: "menuBack"), for: .normal)
        menuBackButton.addTarget(self, action: #selector(returnMainVC), for: .touchUpInside)
        menuBackButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
//Title Leader Board
    func setupTitleLable(){
        let text = "Leaderboard"
        titleLabel.text = text.uppercased()
        titleLabel.font = .systemFont(ofSize: 27, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
//title
    func setupPlayerLabel(){
        playerLabel.text = "PLAYER"
        playerLabel.font = .systemFont(ofSize: 12, weight: .bold)
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scoreLabel.text = "SCORE"
        scoreLabel.font = .systemFont(ofSize: 12, weight: .bold)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        roundsLabel.text = "ROUNDS"
        roundsLabel.font = .systemFont(ofSize: 12, weight: .bold)
        roundsLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
//  Constraints
    func makeConstraints(){
        menuBackButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-67)
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(44)
            make.centerX.equalToSuperview()
            make.width.equalTo(237)
            make.height.equalTo(27)
        }
        
        playerLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(52)
            make.left.equalToSuperview().offset(213)
        }
       
        scoreLabel.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(52)
            make.left.equalTo(playerLabel.snp.right).offset(111)
        }
        
        roundsLabel.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(52)
            make.left.equalTo(scoreLabel.snp.right).offset(111)
        }
        
//        circle
        firstCircleView.snp.makeConstraints { make in
            make.left.equalTo(firstStack.snp.left)
            make.center.equalTo(place.snp.center)
            make.width.equalTo(56)
            make.height.equalTo(56)

        }
        
        secondCircleView.snp.makeConstraints { make in
            make.left.equalTo(secondStack.snp.left)
            make.center.equalTo(place2.snp.center)
            make.width.equalTo(56)
            make.height.equalTo(56)

        }
        
        thirdCircleView.snp.makeConstraints { make in
            make.left.equalTo(thirdStack.snp.left)
            make.center.equalTo(place3.snp.center)
            make.width.equalTo(56)
            make.height.equalTo(56)

        }
        
//        stack
        firstStack.snp.makeConstraints { make in
            make.centerX.equalTo(scoreLabel.snp.centerX)
            make.top.equalTo(scoreLabel.snp.bottom).offset(11)
            make.width.equalTo(692)
            make.height.equalTo(56)
        }
        
        secondStack.snp.makeConstraints { make in
            make.centerX.equalTo(scoreLabel.snp.centerX)
            make.top.equalTo(firstStack.snp.bottom).offset(10)
            make.width.equalTo(692)
            make.height.equalTo(56)
        }
        
        thirdStack.snp.makeConstraints { make in
            make.centerX.equalTo(scoreLabel.snp.centerX)
            make.top.equalTo(secondStack.snp.bottom).offset(10)
            make.width.equalTo(692)
            make.height.equalTo(56)
        }
        
//place number
        place.snp.makeConstraints{ make in
            make.left.equalTo(firstStack.snp.left).offset(20)
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        
        place2.snp.makeConstraints{ make in
            make.left.equalTo(secondStack.snp.left).offset(20)
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
        
        place3.snp.makeConstraints{ make in
            make.left.equalTo(thirdStack.snp.left).offset(20)
            make.width.equalTo(56)
            make.height.equalTo(56)
        }
//player Name
        playerName.snp.makeConstraints{ make in
            make.centerX.equalTo(playerLabel.snp.centerX)
            make.centerY.equalTo(firstStack.snp.centerY)
            
        }
        
        playerName2.snp.makeConstraints{ make in
            make.centerX.equalTo(playerLabel.snp.centerX)
            make.centerY.equalTo(secondStack.snp.centerY)
        }
        
        playerName3.snp.makeConstraints{ make in
            make.centerX.equalTo(playerLabel.snp.centerX)
            make.centerY.equalTo(thirdStack.snp.centerY)
        }
       
//        rounds
        round.snp.makeConstraints{ make in
            make.centerX.equalTo(roundsLabel.snp.centerX)
            make.centerY.equalTo(firstStack.snp.centerY)
            
        }
        
        round2.snp.makeConstraints{ make in
            make.centerX.equalTo(roundsLabel.snp.centerX)
            make.centerY.equalTo(secondStack.snp.centerY)
        }
        
        round3.snp.makeConstraints{ make in
            make.centerX.equalTo(roundsLabel.snp.centerX)
            make.centerY.equalTo(thirdStack.snp.centerY)
        }
    }
    
    
// Navigation - return on MainViewController
    @objc func returnMainVC() {
        self.dismiss(animated: true)
    }

}
