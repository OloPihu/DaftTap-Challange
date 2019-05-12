//
//  SecondViewController.swift
//  DaftTap Challange
//
//  Created by Aleksander  on 11/05/2019.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var prepareView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var countingLabel: UILabel!
    
    @IBOutlet weak var timerTextLabel: UILabel!
    @IBOutlet weak var buttonView: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreTextLabel: UILabel!
    
    
    var score = 0
    
    var timer:Timer?
    var miliseconds:Float = 8 * 1000
    var miliseconds2:Float = 3 * 1000
    var timerView:Timer?
    
    override func viewWillAppear(_ animated: Bool) {
        
         timer2()
        timerView = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timer2), userInfo: nil, repeats: true)
        
        RunLoop.main.add(timerView!, forMode: .common)    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        prepareView.alpha = 1
        
        infoLabel.text = "Your task is to press the dog icon as many times as possible within 5 seconds"
        infoLabel.textColor = UIColor.lightGray
        infoLabel.font = UIFont(name:"ArialRoundedMTBold", size: 20)
        
        
        timerTextLabel.text = "Remaining seconds to pat the dog"
        timerTextLabel.textColor = UIColor.lightGray
        timerTextLabel.font = UIFont(name:"ArialRoundedMTBold", size: 20)
        
        scoreTextLabel.text = "Patted Dogs!"
        scoreTextLabel.textColor = UIColor.lightGray
        scoreTextLabel.font = UIFont(name:"ArialRoundedMTBold", size: 30)
        
        
        scoreLabel.text = String(score)
        scoreLabel.text = "\(score)"
        scoreLabel.textColor = UIColor.white
        scoreLabel.font = UIFont(name:"ArialRoundedMTBold", size: 40)
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        
        RunLoop.main.add(timer!, forMode: .common)
        
        
        
    }
    
    
    @IBAction func actionButton(_ sender: Any) {
        
        score += 1
        scoreLabel.text = String(score)
        SoundService.playSounds(.pat)
        
    }
    
    @objc func timerElapsed() {
        
        miliseconds -= 1
        
        let seconds =  String(format: "%.2f", miliseconds/1000)
    
        timeLabel.text = "\(seconds)"
        
        if miliseconds <= 0 {
            
            timer?.invalidate()
            
            gamesTimeEnd()
            
        }
    }
    
    func gamesTimeEnd() {
        
        var title = ""
        var message = ""
        
        // wynik mniejszy niz rekordy zamienic 5 na high score
        
        if miliseconds == 0 && score < 5 {
            
            timer?.invalidate()
            title = "Times out!"
            message = "Your score is \(score)"
            SoundService.playSounds(.endGame)
            
        }
            // wynik wyzszy niz rekordy zamienic 5 na high score
        else {
            
            if miliseconds == 0 && score >= 5 {
                
                timer?.invalidate()
                title = "Congratulations! Your result goes to high score table!"
                message = "Your score is \(score)"
                SoundService.playSounds(.bestScore)
            }
            
        }
        
        showAlert(title, message)
    }
    
    func showAlert(_ title:String, _ message:String) {
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let alertAction = UIAlertAction(title: "Play Again", style: .default, handler: { _ in
            
            self.performSegue(withIdentifier: "backSegue", sender: nil) } )
        
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion:  nil)
        
    }
    
    @objc func timer2() {
        
        
        miliseconds -= 1
        
        let seconds =  String(format: "%.2f", miliseconds2/1000)
        
        countingLabel.text = "Seconds to Start: \(seconds)"
        countingLabel.textColor = UIColor.white
        countingLabel.font = UIFont(name:"ArialRoundedMTBold", size: 15)
        
        if miliseconds2 <= 0 {
            
            timer?.invalidate()
            
            prepareView.alpha = 0
            
            
        }
    }}


