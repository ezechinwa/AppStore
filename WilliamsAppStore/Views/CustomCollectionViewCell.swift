//
//  CustomCollectionViewCell.swift
//  WilliamsAppStore
//
//  Created by Chinwa Williams on 02/03/2019.
//  Copyright © 2019 Chinwa Williams. All rights reserved.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
   
    let appIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor =  ColorsUtils().hexStringToUIColor(hex: "#1E88E5")
        imageView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let nameLabel : UILabel = {
        let nameLabel = UILabel()
         nameLabel.textColor = ColorsUtils().hexStringToUIColor(hex: "#000000")
         nameLabel.text = "App Name"
        nameLabel.font = .boldSystemFont(ofSize: 14)
        nameLabel.lineBreakMode = .byClipping
        nameLabel.adjustsFontSizeToFitWidth = true
         return nameLabel
    }()
    let descriptionLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = ColorsUtils().hexStringToUIColor(hex: "#000000")
        nameLabel.text = "This is the description of the app"
        nameLabel.font = .systemFont(ofSize: 12)
        nameLabel.lineBreakMode = .byClipping
        nameLabel.adjustsFontSizeToFitWidth = true
        return nameLabel
    }()
    let ratingLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = ColorsUtils().hexStringToUIColor(hex: "#000000")
        nameLabel.font = .systemFont(ofSize: 10)
        nameLabel.lineBreakMode = .byClipping
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.text = "9.9M"
        return nameLabel
    }()
    
    let getButton : UIButton = {
        let getButton = UIButton(type: .system)
        getButton.setTitle("Get", for: .normal)
        getButton.setTitleColor(.white , for: .normal)
        getButton.backgroundColor = (ColorsUtils().hexStringToUIColor(hex: "#1E88E5"))
        getButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius = 5
        return getButton
    }()
    
    
    let previewImage1: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor =  ColorsUtils().hexStringToUIColor(hex: "#1E88E5")
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.layer.cornerRadius = 2
        imageView.clipsToBounds = true
        
        return imageView
    }()
    let previewImage2: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor =  ColorsUtils().hexStringToUIColor(hex: "#1E88E5")
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.layer.cornerRadius = 2
        imageView.clipsToBounds = true
        
        return imageView
    }()
    let previewImage3: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor =  ColorsUtils().hexStringToUIColor(hex: "#1E88E5")
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.layer.cornerRadius = 2
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    fileprivate func setUpConstraints(){
      let verticalStackview = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel, ratingLabel])
        verticalStackview.axis = .vertical
        verticalStackview.alignment = .leading
        
      let horizontalPreviewImageStackView = UIStackView(arrangedSubviews: [previewImage1, previewImage2, previewImage3])
        horizontalPreviewImageStackView.axis = .horizontal
        horizontalPreviewImageStackView.distribution = .fillEqually
        horizontalPreviewImageStackView.spacing = 10
        
        
      let horizontalStackview = UIStackView(arrangedSubviews: [appIcon, verticalStackview , getButton])
          horizontalStackview.axis = .horizontal
          horizontalStackview.spacing = 12
          horizontalStackview.alignment = .center
        
        
        let cellStackView = UIStackView(arrangedSubviews: [horizontalStackview, horizontalPreviewImageStackView])
        cellStackView.axis = .vertical
        cellStackView.spacing = 10
        
    
        addSubview(cellStackView)
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.topAnchor.constraint(equalTo: self.topAnchor ).isActive = true
        cellStackView.leadingAnchor.constraint(equalTo:self.leadingAnchor, constant: 16).isActive = true
        cellStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16).isActive = true
        cellStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
    }
    
    
    fileprivate func setUpconstraintsSnapkit(){
        
        
        let verticalTextLabels = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel , ratingLabel])
        verticalTextLabels.axis = .vertical
        verticalTextLabels.alignment = .top
 
        let imageTextStackview = UIStackView(arrangedSubviews: [appIcon, verticalTextLabels])
        imageTextStackview.axis = .horizontal
        imageTextStackview.alignment = .top
        imageTextStackview.spacing = 5
        
        let horizontalUpperLayer = UIStackView(arrangedSubviews: [imageTextStackview , getButton])
        horizontalUpperLayer.axis = .horizontal
        horizontalUpperLayer.spacing = 5
        horizontalUpperLayer.alignment = .center
        
        
        let horizonalBottomLayer = UIStackView(arrangedSubviews: [previewImage1, previewImage2, previewImage3])
        horizonalBottomLayer.spacing = 10
        horizonalBottomLayer.axis = .horizontal
        horizonalBottomLayer.distribution = .fillEqually
        
        let finalConstraint = UIStackView(arrangedSubviews: [horizontalUpperLayer, horizonalBottomLayer])
            finalConstraint.axis = .vertical
        
        addSubview(finalConstraint)
        finalConstraint.snp.makeConstraints { (make) in
            make.top.equalTo(snp_topMargin)
            make.right.equalTo(snp_rightMargin).offset(-16)
            make.left.equalTo(snp_leftMargin).offset(16)
            make.bottom.equalTo(snp_bottomMargin)
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        backgroundColor = ColorsUtils().hexStringToUIColor(hex: "#FFFFFF")
//        setUpConstraints()
        setUpconstraintsSnapkit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
