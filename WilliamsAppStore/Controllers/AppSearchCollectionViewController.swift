//
//  AppSearchCollectionViewController.swift
//  WilliamsAppStore
//
//  Created by Chinwa Williams on 02/03/2019.
//  Copyright © 2019 Chinwa Williams. All rights reserved.
//

import UIKit
import ProgressHUD
import SDWebImage


class AppSearchCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    fileprivate let celltag: String = "CELLTAG"
    fileprivate var appResult = [Result]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: celltag)
        
        fetchItunesApps()
    }
    

    
    fileprivate func fetchItunesApps(){
        
        APIService.shared.fetchApps { (results) in
            self.appResult = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
    }
//    UICollectionViewDelegateFlowLayout Method
    
    func collectionView(_: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 300)
//        return CGSize.init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_: UICollectionView, layout: UICollectionViewLayout, minimumLineSpacingForSectionAt: Int) -> CGFloat {
        return 1
    }
    
    //    UICollectionViewDelegateFlowLayout Method End
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResult.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: celltag, for: indexPath) as! CustomCollectionViewCell
        cell.nameLabel.text = appResult[indexPath.row].trackName
        cell.descriptionLabel.text = appResult[indexPath.row].primaryGenreName
        cell.ratingLabel.text =   "Users Rating \(appResult[indexPath.row].averageUserRating ?? 0)"
        
        
        print(appResult[indexPath.row].artworkUrl100)
        
        
        cell.appIcon.sd_setImage(with: URL(string: appResult[indexPath.row].artworkUrl100), placeholderImage: UIImage(named: "placeholder.png"))
       
    
       
        
        if appResult[indexPath.row].screenshotUrls.count == 1
        {
            cell.previewImage1.sd_setImage(with: URL(string: appResult[indexPath.row].screenshotUrls[0]), placeholderImage: UIImage(named: "placeholder.png"))
        }
        else if appResult[indexPath.row].screenshotUrls.count == 2
        {
             cell.previewImage1.sd_setImage(with: URL(string: appResult[indexPath.row].screenshotUrls[0]), placeholderImage: UIImage(named: "placeholder.png"))
            
                cell.previewImage2.sd_setImage(with: URL(string: appResult[indexPath.row].screenshotUrls[1]), placeholderImage: UIImage(named: "placeholder.png"))
        }
        
        else if appResult[indexPath.row].screenshotUrls.count >= 3
        {
            cell.previewImage1.sd_setImage(with: URL(string: appResult[indexPath.row].screenshotUrls[0]), placeholderImage: UIImage(named: "placeholder.png"))
            
            cell.previewImage2.sd_setImage(with: URL(string: appResult[indexPath.row].screenshotUrls[1]), placeholderImage: UIImage(named: "placeholder.png"))
            
             cell.previewImage3.sd_setImage(with: URL(string: appResult[indexPath.row].screenshotUrls[2]), placeholderImage: UIImage(named: "placeholder.png"))
            
        }
        
        cell.appIcon.layer.cornerRadius = 16
        return cell
    }

    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
