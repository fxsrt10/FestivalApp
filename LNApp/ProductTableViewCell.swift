//
//  ProductTableViewCell.swift
//  LNApp
//
//  Created by Faysal Sharif on 7/26/18.
//  Copyright © 2018 Faysal Sharif. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var itemField: UILabel!
    @IBOutlet weak var priceField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
