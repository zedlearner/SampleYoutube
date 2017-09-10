//
//  Channel.swift
//  YoutubeSample
//
//  Created by Admin on 19/06/1939 Saka.
//  Copyright © 1939 Saka zedlearner. All rights reserved.
//

import UIKit

class Channel: NSObject {
    var name: String?
    var profileImageUrl: String?
    
    
    init(dict: [String: Any]) {
        name = dict["name"] as? String
        profileImageUrl = dict["profile_image_name"] as? String
    }
}
