//
//  ThumbnailViewCell.swift
//  YoutubeSample
//
//  Created by Admin on 07/05/1939 Saka.
//  Copyright © 1939 Saka zedlearner. All rights reserved.
//

import UIKit



class ThumbnailViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var profileImageView: RoundedImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleTextView: UITextView!
    
    func configureCell(video: Video) {
        titleLabel.text = video.title
        
        if let thumbnailUrlString = video.thumbnailImageURL {
            thumbnailImageView.downloadImageWithUrlString(urlString: thumbnailUrlString)
        }
        
        if let profileImageUrlString = video.channel?.profileImageUrl {
            profileImageView.downloadImageWithUrlString(urlString: profileImageUrlString)
        }
        
        if let channelName = video.channel?.name, let numberOfViews = video.numberOfViews {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            if let numberOfViewsString = numberFormatter.string(from: numberOfViews)
            {
                let subTitleText = "\(channelName)• \(numberOfViewsString) views"
                subTitleTextView.textContainer.lineFragmentPadding = 0
                subTitleTextView.text = subTitleText
            }
        }
        
    }
    
}
