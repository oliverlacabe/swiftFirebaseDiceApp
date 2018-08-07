//
//  UsersDataControllerViewController.swift
//  Oli Test
//
//  Created by oliver lacabe on 03/08/2018.
//  Copyright © 2018 oliver lacabe. All rights reserved.
//

import UIKit
import FirebaseDatabase

class UsersDataControllerViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference?
    var refHandler: DatabaseHandle?
    
    var users: [UsersData] = [UsersData](){
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.separatorStyle = .none
        
        createArray { (dataUsers) in
            guard let users = dataUsers else { return }
            self.users = users
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createArray(completion: @escaping (_ result: [UsersData]?) -> ()) {
        var tempStrings: [UsersData] = []
        
        refHandler = self.ref?.child("users").observe(.value, with: { (snapshot) in
            if snapshot.childrenCount > 0{
                self.users.removeAll()
                for users in snapshot.children.allObjects as! [DataSnapshot]{
                    if let userObject = users.value as? [String: Any]{
                        let uname = "\(String(describing: userObject["lname"] as! String)), \(String(describing: userObject["fname"] as! String))"
                        let uid   = users.key
                        let uInfo = UsersData(userImage: #imageLiteral(resourceName: "userImg"), userName: uname, userId: uid)
                        tempStrings.append(uInfo)
                    }
                }
                completion(tempStrings)
                tempStrings.removeAll()
            }
        })
    }
    
    @IBAction func btnDeletePressed(_ sender: UIButton) {
        sender.pulsate(
            duration: 0.6,
            fVal: 0.95,
            aRev: false,
            repeatCount: 1,
            vel: 0.5,
            damping: 1.0
        )
        
        if let userId = sender.accessibilityIdentifier{
            let alert = UIAlertController(title: "Are you sure you want to delete this user?", message: userId, preferredStyle: .alert)
            
            // Create OK button
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                self.users.removeAll()
                // Delete data from firbase database
                self.ref?.child("users").child(userId).removeValue()
                
            }
            alert.addAction(OKAction)
            
            // Create Cancel button
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
                print("Cancel button tapped");
            }
            alert.addAction(cancelAction)
            
            // Present Dialog message
            self.present(alert, animated: true, completion:nil)
        }
    }
    
}

extension UsersDataControllerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserCellTableViewCell
        cell.setUser(user: user)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
