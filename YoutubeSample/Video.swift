//
//  Video.swift
//  YoutubeSample
//
//  Created by Admin on 19/06/1939 Saka.
//  Copyright © 1939 Saka zedlearner. All rights reserved.
//

import UIKit

class Video: NSObject {
    var title: String?
    var thumbnailImageURL: String?
    var numberOfViews: NSNumber?
    var channel: Channel?
    
    init(dict: [String:Any]) {
        title = dict["title"] as? String
        thumbnailImageURL = dict["thumbnail_image_name"] as? String
        numberOfViews = dict["number_of_views"] as? NSNumber
        if let channelDict = dict["channel"] as? [String : Any] {
            channel = Channel(dict: channelDict)
        }
    }
}
