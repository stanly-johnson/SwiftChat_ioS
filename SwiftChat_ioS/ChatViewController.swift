//
//  ChatViewController.swift
//  SwiftChat_ioS
//
//  Created by Stanly on 16/11/17.
//  Copyright © 2017 Stanly. All rights reserved.
//

import UIKit

class ChatViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(PersonCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.alwaysBounceVertical = true
        navigationItem.title = "Recent"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    
    }
    
    
    class PersonCell : BaseCell {
        
        let profileImageView : UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 34
            imageView.layer.masksToBounds = true
            return imageView
        }()
        
        
        let dividerLineView : UIView = {
            let divideLine = UIView()
            divideLine.backgroundColor = UIColor.black
            return divideLine
        }()
        
        override func setupViews() {
            
            addSubview(profileImageView)
            addSubview(dividerLineView)
            
            profileImageView.image = UIImage(named: "icon")
            profileImageView.translatesAutoresizingMaskIntoConstraints = false
            profileImageView.translatesAutoresizingMaskIntoConstraints = false
            
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[V0(68)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["V0" : profileImageView]))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[V0(68)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["V0" : profileImageView]))
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-82-[V0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["V0" : dividerLineView]))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[V0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["V0" : dividerLineView]))
            
        }
    }
    
    class BaseCell : UICollectionViewCell {
        
        override init(frame:CGRect){
            super.init(frame: frame)
            setupViews()
        }
        
        required init?(coder aDecoder : NSCoder){
            fatalError("init coder not implemented")
        }
        
        func setupViews(){
            backgroundColor = UIColor.cyan
        }
        
    }
    
    
 }

