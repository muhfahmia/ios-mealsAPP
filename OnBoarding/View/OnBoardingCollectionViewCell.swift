//
//  OnBoardingCollectionViewCell.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 22/10/23.
//

import UIKit
import Core
import Domain

class OnBoardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var boardView: UIImageView!
    
    static var identifier: String {
        String(describing: OnBoardingCollectionViewCell.self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with board: BoardPage?) {
        boardView.image = UIImage(nameOrSystemName: board?.viewAnimate ?? "")
    }
}
