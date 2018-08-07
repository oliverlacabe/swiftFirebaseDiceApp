//
//  ViewController.swift
//  Oli Test
//
//  Created by oliver lacabe on 30/07/2018.
//  Copyright © 2018 oliver lacabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var diceBanner: UIImageView!
    @IBOutlet weak var btnRoll: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnRoll.layer.cornerRadius = 25
        randomizeImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        diceBanner.imagePulsate(
            duration: 3.0,
            fVal: 0.90,
            repeatCount: 99999,
            vel: 2.0,
            damping: 3.0
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        sender.pulsate(
            duration: 0.6,
            fVal: 0.95,
            aRev: false,
            repeatCount: 1,
            vel: 0.5,
            damping: 1.0
        )
        randomizeImage()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        randomizeImage()
    }
    
    func randomizeImage(){
        awesomeImage.isHidden = true
        
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        
        if((randomDiceIndex1 + randomDiceIndex2) > 6){
            awesomeImage.isHidden = false
        }
    }
    
}

