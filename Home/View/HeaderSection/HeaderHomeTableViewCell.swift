//
//  HeaderHomeTableViewCell.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 23/10/23.
//

import UIKit

class SearchResult: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
    
}

class HeaderHomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var searchText: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
