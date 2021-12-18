//
//  searchBarCell.swift
//  MigrosApp
//
//  Created by Furkan Kara on 15.12.2021.
//

import UIKit

class searchBarCell: UITableViewCell , UISearchBarDelegate {

    @IBOutlet weak var searcBar: UISearchBar!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searcBar.delegate = self
        searcBar.layer.borderWidth = 1
        
    
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
   
    
    
    
}


