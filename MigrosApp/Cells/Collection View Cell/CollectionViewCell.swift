//
//  CollectionViewCell.swift
//  MigrosApp
//
//  Created by Furkan Kara on 17.12.2021.
//

import UIKit

class CollectionViewCell: UITableViewCell {
    
    var product = Product()

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
         
        
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let collectionCellNib = UINib(nibName: "ProductCell", bundle: nil)
        collectionView.register(collectionCellNib, forCellWithReuseIdentifier: "ProductCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(product : Product){
        self.product = product
//        self.collectionView.reloadData()
        
    }

}

extension CollectionViewCell : UICollectionViewDelegate,  UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.configure(product: product)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       
        
       
        
        return CGSize(width: 210, height: 320)
    }
    
    
    
    
    
    
    
}
