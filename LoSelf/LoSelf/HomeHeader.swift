//
//  HomeHeader.swift
//  LoSelf
//
//  Created by Dzy on 27/07/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

import UIKit
import MMBannerLayout

class HomeHeader: UIView,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collection: UICollectionView!
    var images = [#imageLiteral(resourceName: "images"),#imageLiteral(resourceName: "images2"),#imageLiteral(resourceName: "images3")]

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let space = d_width / 6
        
        self.layoutIfNeeded()
        
        DispatchQueue.main.async {
            
            if let layout = self.collection.collectionViewLayout as? MMBanerLayout {
                layout.itemSize = self.collection.frame.insetBy(dx: space, dy: 0).size
                //            layout.angle = 45
                layout.itemSpace = 8.0
                layout.autoPlayStatus = .play(duration: 4.5)
                layout.setInfinite(isInfinite: true, completed:nil)
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Click  \(indexPath)")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, focusAt indexPath: IndexPath) {
        print("Focus At \(indexPath)")
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderBannerCell", for: indexPath) as? HeaderBannerCell {
            cell.imgView.image = images[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
