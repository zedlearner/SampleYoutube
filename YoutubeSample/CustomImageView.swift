//
//  DownloadManager.swift
//  YoutubeSample
//
//  Created by Admin on 19/06/1939 Saka.
//  Copyright © 1939 Saka zedlearner. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func downloadImageWithUrlString(urlString: String) -> Void {
        image = nil
        let url = URL(string: urlString)
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = imageFromCache
            return
        }
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error)
            } else {
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data!)
                    self.image = imageToCache
                    imageToCache?.setValue(imageToCache, forKey: urlString)
                }
            }
        }.resume()
    }
}
