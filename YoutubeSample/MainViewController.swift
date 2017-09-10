//
//  MainViewController.swift
//  YoutubeSample
//
//  Created by Admin on 18/06/1939 Saka.
//  Copyright © 1939 Saka zedlearner. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var thumbnailCollectionView: UICollectionView!
    
    let menuCellIdentifier = "MenuCell", thumbanilCellIdentifier = "ThumbnailCell"
    let menuImageNames = ["home", "home", "home", "home"]
    let feedUrlString = "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json"
    
    var videos: [Video]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        fetchVideos()
        // Do any additional setup after loading the view.
    }
    

    func fetchVideos() {
        let url = URL(string: feedUrlString)
        URLSession.shared.dataTask(with: url!) { [weak self] (data, response, error) in
            if error != nil {
                print(error)
            } else {
                do {
                    self?.videos = [Video]()
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String : Any]] {
                        for dict in json {
                            let video = Video(dict: dict)
                            self?.videos?.append(video)
                        }
                        DispatchQueue.main.async {
                            self?.thumbnailCollectionView.reloadData()
                        }
                    }
                }
                catch let jsonError {
                    print(jsonError)
                }
            }
            
        }.resume()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuCollectionView {
            return menuImageNames.count
        } else {
            return videos?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if (collectionView == menuCollectionView) {
            if let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: menuCellIdentifier, for: indexPath) as? MenuCollectionViewCell
            {
                menuCell.configureCell(imageName: menuImageNames[indexPath.item])
                cell = menuCell
            }
            
        } else {
            if let thumbnailCell = collectionView.dequeueReusableCell(withReuseIdentifier: thumbanilCellIdentifier, for: indexPath) as? ThumbnailViewCell {
                thumbnailCell.configureCell(video: (videos?[indexPath.item])!)
                cell = thumbnailCell
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == menuCollectionView {
            return CGSize(width: collectionView.bounds.width / 4, height: collectionView.frame.height)
        } else {
            let height = ((collectionView.frame.width - (2 * 8)) * 9 / 16) + 82
            return CGSize(width: collectionView.frame.width, height: height)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
