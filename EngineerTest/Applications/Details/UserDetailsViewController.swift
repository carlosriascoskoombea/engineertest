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
        cell.image.kf.setImage(with: url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = user?.items?.count else { return 0 }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: 30)
    }
    
}


