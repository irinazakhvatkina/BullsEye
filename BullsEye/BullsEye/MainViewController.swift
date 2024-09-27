//
//  ViewController.swift
//  BullsEye
//
//  Created by Irina Zakhvatkina on 16/09/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    let gameManager = BullsEyeGameManaager()
//    UIKit
    let titleLabel = UILabel()
    let guessingNumberLabel = UILabel()
    let slider = UISlider()
    let oneNumberLabel = UILabel()
    let hundredNumberLabel = UILabel()
    let buttonHitMe = UIButton()
    let scoreLabel = UILabel()
    let scoreNumberLabel = UILabel()
    let roundLabel = UILabel()
    let roundNumberLabel = UILabel()
    let backgroundImageView = UIImageView()
    let menuButton = UIButton()
    
    
    
    func setupTitleLabel() {
        let text = "Put the BullSEye as close as you can to"
        titleLabel.text = text.uppercased()
        titleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupGuessingNumberLabel() {
        guessingNumberLabel.text = "\(gameManager.guessingNumber)"
        guessingNumberLabel.font = .systemFont(ofSize: 36, weight: .bold)
        guessingNumberLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupSlider() {
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .lightGray
        slider.backgroundColor = UIColor(red: 0.99, green: 0.34, blue: 0.29, alpha:0)
        slider.setThumbImage(UIImage(named: "slider"), for: .normal)
        slider.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setupOneNumberLabel() {
        oneNumberLabel.text = "1"
        oneNumberLabel.font = .systemFont(ofSize: 18, weight: .medium)
        oneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupHundredNumberLabel() {
        hundredNumberLabel.text = "100"
        hundredNumberLabel.font = .systemFont(ofSize: 18, weight: .medium)
        hundredNumberLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupButtonHitMe(){
        buttonHitMe.setTitle("HIT ME", for: .normal)
        buttonHitMe.titleLabel?.font = .systemFont(ofSize: 21, weight: .bold)
        buttonHitMe.tintColor = .white
        buttonHitMe.backgroundColor = UIColor(red: 0.28, green: 0.35, blue: 0.99, alpha: 1.00)
        buttonHitMe.layer.cornerRadius = 21
        buttonHitMe.layer.borderWidth = 5
        buttonHitMe.layer.borderColor = UIColor.white.cgColor
        buttonHitMe.translatesAutoresizingMaskIntoConstraints = false
        
        buttonHitMe.addTarget(self, action: #selector(handleHitMeButtonAction), for: .touchUpInside)
    }
    
    func setupScoreLabel(){
        let text = "score"
        scoreLabel.text = text.uppercased()
        scoreLabel.font = .systemFont(ofSize: 12, weight: .medium)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupscoreNumberLabel(){
        scoreNumberLabel.text = "\(gameManager.score)"
        scoreNumberLabel.font = .systemFont(ofSize: 21, weight: .bold)
        scoreNumberLabel.layer.cornerRadius = 21
        scoreNumberLabel.layer.borderWidth = 2
        scoreNumberLabel.layer.borderColor = UIColor(red: 0.82, green: 0.89, blue: 0.98, alpha: 1.00).cgColor
        scoreNumberLabel.textAlignment = .center
        scoreNumberLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupRoundLabel(){
        let text = "round"
        roundLabel.text = text.uppercased()
        roundLabel.font = .systemFont(ofSize: 12, weight: .medium)
        roundLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupRoundNumberLabel(){
        roundNumberLabel.text = "\(gameManager.round)"
        roundNumberLabel.font = .systemFont(ofSize: 21, weight: .bold)
        roundNumberLabel.layer.cornerRadius = 21
        roundNumberLabel.layer.borderWidth = 2
        roundNumberLabel.layer.borderColor = UIColor(red: 0.82, green: 0.89, blue: 0.98, alpha: 1.00).cgColor
        roundNumberLabel.textAlignment = .center
        roundNumberLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupMenuButton(){
        menuButton.setImage(UIImage(named: "menu"), for: .normal)
        menuButton.addTarget(self, action:#selector(showLeaderBoardVC), for: .touchUpInside)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupBackgroundImageView(){
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
//    TODO:
//    show slider's number
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleLabel)
        view.addSubview(guessingNumberLabel)
        view.addSubview(slider)
        slider.value = (slider.minimumValue + slider.maximumValue)/2
        view.addSubview(oneNumberLabel)
        view.addSubview(hundredNumberLabel)
        view.addSubview(buttonHitMe)
        view.addSubview(scoreLabel)
        view.addSubview(scoreNumberLabel)
        view.addSubview(roundLabel)
        view.addSubview(roundNumberLabel)
        view.addSubview(menuButton)
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView) // добавили фото на задний фон
        
        setupTitleLabel()
        setupGuessingNumberLabel()
        setupSlider()
        setupOneNumberLabel()
        setupHundredNumberLabel()
        setupButtonHitMe()
        setupScoreLabel()
        setupscoreNumberLabel()
        setupRoundLabel()
        setupRoundNumberLabel()
        setupMenuButton()
        setupBackgroundImageView()
        makeConstraints()
        
    }
    
    func makeConstraints() {
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
        guessingNumberLabel.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(9)
            make.centerX.equalToSuperview()
        }
        
        oneNumberLabel.snp.makeConstraints{make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(120)
            make.right.equalTo(slider.snp.left).offset(58)
        }
        
        slider.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(500)
            make.height.equalTo(5)
        }
        
        hundredNumberLabel.snp.makeConstraints{make in
            make.centerY.equalTo(slider.snp.centerY)
            make.right.equalToSuperview().offset(57)
            make.left.equalTo(slider.snp.right).offset(40)
        }
        
        buttonHitMe.snp.makeConstraints{make in
            make.top.equalTo(slider.snp.bottom).offset(66)
            make.centerX.equalToSuperview()
            make.width.equalTo(128)
            make.height.equalTo(70)
        }
        
        scoreLabel.snp.makeConstraints{make in
            make.top.equalTo(oneNumberLabel.snp.bottom).offset(50)
            make.centerX.equalTo(scoreNumberLabel.snp.centerX)
        }
        
        scoreNumberLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(274)
            make.right.equalTo(buttonHitMe.snp.left).offset(-214)
            make.width.equalTo(68)
            make.height.equalTo(56)
        }
        
        roundLabel.snp.makeConstraints{make in
            make.top.equalTo(hundredNumberLabel.snp.bottom).offset(50)
            make.centerX.equalTo(roundNumberLabel.snp.centerX)
            make.centerY.equalTo(scoreLabel.snp.centerY)
        }
        
        roundNumberLabel.snp.makeConstraints{make in
            make.top.equalTo(roundLabel.snp.bottom).offset(5)
            make.right.equalToSuperview().offset(-90)
            make.width.equalTo(70)
            make.height.equalTo(56)

        }
        
        menuButton.snp.makeConstraints{ make in
            make.bottom.equalTo(hundredNumberLabel.snp.top).offset(-90)
            make.right.equalToSuperview().offset(-90)
            make.width.equalTo(56)
            make.width.equalTo(56)

        }
        
        backgroundImageView.snp.makeConstraints{make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func showAlertSuccess() {
            let myAlert = UIAlertController(title: "You guessed the number", message: "Congratulations", preferredStyle: .alert)
            let handler: ((UIAlertAction)->Void)? = { action in
                self.gameManager.didWinTheGame()
                self.updateLables()
            }
            let action = UIAlertAction(title: "Start", style: .default, handler: handler)
            myAlert.addAction(action)
            show(myAlert, sender: self)
    }
        
    func showAlertFailure() {
        let myAlert = UIAlertController(title: "You didn't guess the number", message: "Please, try again", preferredStyle: .alert)
        let handler: ((UIAlertAction)->Void)? = { action in
            self.gameManager.didLoseTheGame()
            self.updateLables()
        }
        let action = UIAlertAction(title: "Start", style: .default, handler: handler)
        myAlert.addAction(action)
        show(myAlert, sender: self)
    }
    
    func updateLables(){
        guessingNumberLabel.text = String(gameManager.guessingNumber)
        scoreNumberLabel.text = String(gameManager.score)
        roundNumberLabel.text = String(gameManager.round)

    }
    
    @objc func handleHitMeButtonAction(){
//      TODO:

        let sliderValue = Int(slider.value)

        if sliderValue == gameManager.guessingNumber {
            showAlertSuccess()
        }else{
            showAlertFailure()
        }
    }
    
    @objc func showLeaderBoardVC() {
        let vc = LeaderBoardViewController()
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true)
    }

}


