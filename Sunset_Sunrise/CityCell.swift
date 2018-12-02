//
//  CityCell.swift
//  Sunset_Sunrise
//
//  Created by Benko Ostap on 11/30/18.
//  Copyright © 2018 Ostap Benko. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var sunsetLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
