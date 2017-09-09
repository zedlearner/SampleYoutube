//
//  MenuCollectionViewCell.swift
//  YoutubeSample
//
//  Created by Admin on 18/06/1939 Saka.
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

class MenuCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var menuImageView: UIImageView!
    
    func configureCell(imageName: String) {
        self.backgroundColor = .blue
        menuImageView.image = UIImage(named: imageName)
    }
}
