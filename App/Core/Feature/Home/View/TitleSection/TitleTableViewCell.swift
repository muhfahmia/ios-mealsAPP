//
//  TitleTableViewCell.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 27/10/23.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var subHeaderTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(title: String, subTitle: String) {
        headerTitle.text = title
        subHeaderTitle.text = subTitle
    }
    
}
