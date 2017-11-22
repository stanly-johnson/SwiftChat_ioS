//
//  Constants.swift
//  SwiftChat_ioS
//
//  Created by Stanly on 16/11/17.
//  Copyright © 2017 Stanly. All rights reserved.
//

import Foundation
import Firebase

struct Constants
{
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
}
