//
//  HomeTableViewCell.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 15/11/2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var label_title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
