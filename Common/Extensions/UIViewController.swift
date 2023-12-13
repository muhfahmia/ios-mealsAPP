//
//  UIViewController.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 08/11/23.
//

import UIKit

public extension UIViewController {
    
    func addTapGestureToHideKeyboard() {
      let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
      tap.cancelsTouchesInView = false
      view.addGestureRecognizer(tap)
    }

    @objc func hideKeyboard() {
      view.endEditing(true)
    }

}
