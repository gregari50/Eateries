//
//  EateryDetailTableViewCell.swift
//  Eateries
//
//  Created by Бойко Григорий on 07/05/2020.
//  Copyright © 2020 Бойко Григорий. All rights reserved.
//

import UIKit

class EateryDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
