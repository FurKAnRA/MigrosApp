//
//  HeaderLabelTableViewCell.swift
//  MigrosApp
//
//  Created by Furkan Kara on 16.12.2021.
//

import UIKit

class HeaderLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func labelText(headerLabel : String){
        self.headerLabel.text = headerLabel
    }
    
}
