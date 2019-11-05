//
//  UserDetailsViewController.swift
//  EngineerTest
//
//  Created by Carlos Riascos on 11/5/19.
//  Copyright © 2019 Koombea. All rights reserved.
//

import UIKit
import Kingfisher

class UserDetailsViewController: UIViewController {
    
    @IBOutlet var userName: UILabel? 
    @IBOutlet var userImage: UIImageView?
    @IBOutlet var collectionView: UICollectionView?
    var user: User?
    var limit: Int? = 0
    var offset: Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        let url = URL(string: user?.image ?? "")
        userImage?.kf.setImage(with: url)
        userName?.text = user?.name
        collectionView?.reloadData()
    }
    
}

extension UserDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath as IndexPath) as! ItemCell
        let itemUrl = user?.items?[indexPath.row]
        let url = URL(string: itemUrl ?? "")
        let size = collectionView.frame.size
        let count = user?.items?.count ?? 0
        let cellSize = (count % 2 == 0  ?  size.width / 2 : size.width )
        let resizingProcessor = ResizingImageProcessor(referenceSize: CGSize(width: cellSize, height: cellSize))
        cell.image.kf.indicatorType = .activity
        cell.image.kf.setImage(with: url,
        options: [.processor(resizingProcessor)],
        completionHandler: { [ weak self] image, error, cacheType, imageURL in
        })
        cell.layoutIfNeeded()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = user?.items?.count else { return 0 }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let count = user?.items?.count ?? 0
        let size = collectionView.frame.size
        if count % 2 == 0 {
            // even number
            let cellSize = size.width / 2
            return CGSize(width: cellSize - 8, height: cellSize - 8)
        } else {
            // odd number
            if indexPath.row == 0 {
                let size = collectionView.frame.size
                let cellSize = size.width
                return CGSize(width: cellSize, height: cellSize)
            } else {
                let size = collectionView.frame.size
                let cellSize = size.width / 2
                return CGSize(width: cellSize - 8, height: cellSize - 8)
            }
        }
    }
    
}


