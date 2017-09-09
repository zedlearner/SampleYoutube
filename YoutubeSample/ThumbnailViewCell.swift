//
//  ThumbnailViewCell.swift
//  YoutubeSample
//
//  Created by Admin on 07/05/1939 Saka.
//  Copyright © 1939 Saka zedlearner. All rights reserved.
//

import UIKit

@IBDesignable class RoundedImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat =  0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
}

class ThumbnailViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
}
