//
//  ViewController.swift
//  LoSelf
//
//  Created by Dzy on 26/07/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

import UIKit
import MMBannerLayout

let d_width = UIScreen.main.bounds.size.width
let d_height = UIScreen.main.bounds.size.height

class ViewController: UIViewController {

    var images = [#imageLiteral(resourceName: "images"),#imageLiteral(resourceName: "images2"),#imageLiteral(resourceName: "images3")]

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space = d_width / 6

        self.view.layoutIfNeeded()

        DispatchQueue.main.async {
            
            if let layout = self.collection.collectionViewLayout as? MMBanerLayout {
                layout.itemSize = self.collection.frame.insetBy(dx: space, dy: 0).size
                //            layout.angle = 45
                layout.itemSpace = 8.0
                layout.autoPlayStatus = .play(duration: 4.5)
                layout.setInfinite(isInfinite: true, completed:nil)
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: BannerLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, focusAt indexPath: IndexPath) {
        print("Focus At \(indexPath)")
    }
    
}

extension ViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Click  \(indexPath)")

    }

}

extension ViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell {
            cell.imgView.image = images[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
    }
}
