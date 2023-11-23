//
//  MealFavCollectionViewCell.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 07/11/23.
//

import UIKit
import SDWebImage
import Domain

class MealFavCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealTitle: UILabel!
    @IBOutlet weak var mealBtnDel: UIButton!
    private var meal: Meal?
    var delAction: ((Meal) -> Void)?
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with mealObj: Meal) {
        meal = mealObj
        mealImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        mealImage.sd_setImage(with: URL(string: meal?.imageThumb ?? ""))
        mealTitle.text = meal?.name
        mealBtnDel.addTarget(self, action: #selector(delHandler), for: .touchUpInside)
    }
    
    @objc func delHandler() {
        delAction?(meal!)
    }

}
