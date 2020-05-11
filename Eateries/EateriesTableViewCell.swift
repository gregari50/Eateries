//
//  EateriesTableViewCell.swift
//  Eateries
//
//  Created by Бойко Григорий on 25/04/2020.
//  Copyright © 2020 Бойко Григорий. All rights reserved.
//

import UIKit

class EateriesTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
