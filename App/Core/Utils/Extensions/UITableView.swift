//
//  UITableView.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 02/11/23.
//

import UIKit

public extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: name)) as? T else {
            fatalError(
                "Couldn't find UITableViewCell for \(String(describing: name)), make sure the cell is registered with table view")
        }
        return cell
    }
    
    func register<T: UITableViewCell>(cellWithClass name: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: name))
    }
    
    func register<T: UITableViewCell>(nib: UINib?, withCellClass name: T.Type) {
        register(nib, forCellReuseIdentifier: String(describing: name))
    }
    
    func register<T: UITableViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) {
       let identifier = String(describing: name)
       var bundle: Bundle?

       if let bundleName = bundleClass {
           bundle = Bundle(for: bundleName)
       }

       register(UINib(nibName: identifier, bundle: bundle), forCellReuseIdentifier: identifier)
   }
    
}

public extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError(
                "Couldn't find UICollectionViewCell for \(String(describing: name)), make sure the cell is registered with collection view")
        }
        return cell
    }
    
    func register<T: UICollectionViewCell>(nib: UINib?, forCellWithClass name: T.Type) {
        register(nib, forCellWithReuseIdentifier: String(describing: name))
    }

    func register<T: UICollectionViewCell>(cellWithClass name: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: name))
    }
    
    func getResponsiveGrid(estimatedWidth: CGFloat, heightRatio: CGFloat, grid: CGFloat) -> CGSize {
        let screenWidth = Constants.deviceWidth
        let deviceModel = Constants.deviceModel
        var estimatedWidth = estimatedWidth
        if deviceModel == "iPad" {
            estimatedWidth = estimatedWidth - 0.35
        }
        let cellWidth = (screenWidth * estimatedWidth) - (grid - 1) / grid
        let cellHeight = cellWidth * heightRatio
        let size = CGSize(width: cellWidth, height: cellHeight)
        return size
    }
    
}
