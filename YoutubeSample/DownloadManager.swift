//
//  DownloadManager.swift
//  YoutubeSample
//
//  Created by Admin on 19/06/1939 Saka.
//  Copyright © 1939 Saka zedlearner. All rights reserved.
//

import UIKit

extension UIImageView {
    
func downloadImageWithUrlString(urlString: String) -> Void {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error)
            } else {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }
        }.resume()
    }
}
