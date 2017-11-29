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
        collectionView?.alwaysBounceVertical = true
        navigationItem.title = "Recent"
        
        collectionView?.register(PersonCell.self, forCellWithReuseIdentifier: cellId)
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
        return CGSize(width: view.frame.width, height: 200)
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(cellId)
    }
    
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

            
            
            return divideLine
        }()
        
        override func setupViews() {
            
            addSubview(profileImageView)
            
            let divideView = dividerLineView
            
            divideView.backgroundColor = UIColor.darkGray
            
            addSubview(divideView)
            setupContainerView()
            
            profileImageView.image = UIImage(named: "icon")
            
            addConstraintsWithFormat(format: "H:|-12-[V0(68)]", views: profileImageView)
            addConstraintsWithFormat(format: "V:[V0(68)]", views: profileImageView)
            
            addConstraint(NSLayoutConstraint(item: profileImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
            
            addConstraintsWithFormat(format: "H:|-82-[V0]", views: dividerLineView)
            addConstraintsWithFormat(format: "V:[V0(1)]|", views: dividerLineView)
            
        }
    
    private func setupContainerView(){
        let containerView = UIView()
        containerView.backgroundColor = UIColor.red
        addSubview(containerView)
        
        addConstraintsWithFormat(format: "H:|-90-[V0]", views: containerView)
        addConstraintsWithFormat(format: "V:[V0(60)]", views: containerView)
        addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
        
}
        
extension UIView {
            
        func addConstraintsWithFormat(format : String, views : UIView...){
            
            var viewsDict = [String : UIView]()
            for(index, view) in views.enumerated(){
                let key = "V\(index)"
                viewsDict[key] = view
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
        
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
            backgroundColor = UIColor.green
        }
        
}
    
    


