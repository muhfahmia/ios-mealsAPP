//
//  HeaderHomeTableViewCell.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 23/10/23.
//

import UIKit

public class HeaderHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var searchText: UITextField!
    
    public static var identifier: String {
        String(describing: HeaderHomeTableViewCell.self)
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
