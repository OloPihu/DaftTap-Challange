//
//  ViewController.swift
//  DaftTap Challange
//
//  Created by Aleksander  on 11/05/2019.
//

import UIKit


fileprivate let segueId: String = "segue"

class ViewController: UIViewController {

    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    
        override func viewDidLoad() {
            super.viewDidLoad()

            
            
            highScoreLabel.text = "Players with high score"
            highScoreLabel.textColor = UIColor.black
            highScoreLabel.font = UIFont(name:"ArialRoundedMTBold", size: 15)
            
            
            playButton.setTitle("Play", for: .normal)
         
    
            titleLabel.text = "DaftTap Challange"
            titleLabel.textColor = UIColor.lightGray
            titleLabel.font = UIFont(name:"ArialRoundedMTBold", size: 35)

}

}
