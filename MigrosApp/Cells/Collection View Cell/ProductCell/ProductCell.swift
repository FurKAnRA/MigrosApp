//
//  ProductCell.swift
//  MigrosApp
//
//  Created by Furkan Kara on 17.12.2021.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var productName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
  

    func configure(product : Product){
        self.productImage.image = UIImage(named: product.image!)
        self.productName.text = product.productName!
        self.productPrice.text = "\(product.productPrice!) TL"
    }
}
