//
//  PlayerViewController.swift
//  Oli Test
//
//  Created by oliver lacabe on 31/07/2018.
//  Copyright © 2018 oliver lacabe. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var imgLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnPlay.layer.cornerRadius = 25
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        btnPlay.pulsate(
            duration: 3.0,
            fVal: 0.90,
            aRev: true,
            repeatCount: 99999,
            vel: 3.0,
            damping: 3.0
        )
    }

    @IBAction func btnPlayPressed(_ sender: UIButton) {
        sender.pulsate(
            duration: 0.6,
            fVal: 0.95,
            aRev: false,
            repeatCount: 1,
            vel: 0.5,
            damping: 1.0
        )
    }
}
