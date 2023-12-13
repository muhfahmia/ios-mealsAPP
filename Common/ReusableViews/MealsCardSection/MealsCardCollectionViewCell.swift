//
//  MealsCardCollectionViewCell.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 28/10/23.
//

import UIKit
import SDWebImage
import Domain

public class MealsCardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mealsImage: UIImageView!
    @IBOutlet weak var mealsTitle: UILabel!
    
    public static var identifier: String {
        String(describing: MealsCardCollectionViewCell.self)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        //        print("CL CellContent: \(self.contentView.bounds)")
        // Initialization code
    }
    
    public func configure(with meal: Meal) {
        mealsImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        mealsImage.sd_setImage(with: URL(string: meal.imageThumb ?? ""))
        mealsTitle.text = meal.name
    }
    
}
