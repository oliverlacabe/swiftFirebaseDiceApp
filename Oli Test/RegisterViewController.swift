//
//  RegisterViewController.swift
//  Oli Test
//
//  Created by oliver lacabe on 02/08/2018.
//  Copyright © 2018 oliver lacabe. All rights reserved.
//

import UIKit
import FirebaseDatabase

class RegisterViewController: UIViewController {

    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPass: UITextField!
    
    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func btnSavePressed(_ sender: UIButton) {
        let uLname: String = lname.text!
        let uFname: String = fname.text!
        let uEmail: String = userEmail.text!
        let uPass : String = userPass.text!
        
        sender.pulsate(
            duration: 0.6,
            fVal: 0.95,
            aRev: false,
            repeatCount: 1,
            vel: 0.5,
            damping: 1.0
        )
    
        let details = [
            "email": uEmail,
            "lname" : uLname,
            "fname" : uFname,
            "password" : uPass
        ]
        
        self.ref?.child("users").childByAutoId().setValue(details)
        let alert = UIAlertController(title: "User successfully saved!", message: "", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        // Present Dialog message
        self.present(alert, animated: true, completion:nil)
        
        lname.text = ""
        fname.text = ""
        userEmail.text = ""
        userPass.text = ""
    }
}
