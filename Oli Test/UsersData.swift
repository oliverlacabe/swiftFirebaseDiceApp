//
//  UsersData.swift
//  Oli Test
//
//  Created by oliver lacabe on 03/08/2018.
//  Copyright © 2018 oliver lacabe. All rights reserved.
//

import Foundation
import UIKit

class UsersData {
    var userImage: UIImage
    var userName : String
    var userId : String
    
    init (userImage: UIImage, userName: String, userId: String){
        self.userImage = userImage
        self.userName  = userName
        self.userId    = userId
    }
    
}
