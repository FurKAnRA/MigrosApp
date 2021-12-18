//
//  searchBarCell.swift
//  MigrosApp
//
//  Created by Furkan Kara on 15.12.2021.
//

import UIKit

class searchBarCell: UITableViewCell {

    @IBOutlet weak var searcBar: UISearchBar!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        searcBar.layer.borderWidth = 1
        searcBar.layer.borderColor = UIColor.white.cgColor
        searcBar.endEditing(true)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
