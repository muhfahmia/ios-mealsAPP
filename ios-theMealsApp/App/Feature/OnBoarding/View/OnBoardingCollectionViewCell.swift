//
//  OnBoardingCollectionViewCell.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 22/10/23.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var boardView: UIImageView!
    
    var board: Board? {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure() {
        boardView.image = UIImage(named: (board?.viewAnimate)!)
    }
}
