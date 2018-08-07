//
//  userCellTableViewCell.swift
//  Oli Test
//
//  Created by oliver lacabe on 03/08/2018.
//  Copyright © 2018 oliver lacabe. All rights reserved.
//

import UIKit

class UserCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userLabelView: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    
    func setUser(user: UsersData){
        userImageView.image = user.userImage
        userLabelView.text  = user.userName
        btnDelete.accessibilityIdentifier = user.userId
    }
}
