//
//  HomeTabBarController.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 22/10/23.
//

import UIKit
import Home

public class HomeTabBarController: UITabBarController {
    
    private let router: HomeRouteCase

    init(router: HomeRouteCase) {
      self.router = router
      super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
      super.viewDidLoad()
      configureTabBar()
    }
    
    private func configureTabBar() {
        
        tabBar.barTintColor = UIColor.backgroundColor
        tabBar.backgroundColor = UIColor.backgroundColor

        let homeTab = createTabController(vc: router.homeVC, image: setImageTab(imageSystem: "fork.knife.circle.fill"))
        let favTab = createTabController(vc: router.favVC, image: setImageTab(imageSystem: "heart.fill"))
        let aboutTab = createTabController(vc: router.aboutVC, image: setImageTab(imageSystem: "person.fill"))
        setViewControllers([homeTab, favTab, aboutTab], animated: true)
    }
    
    private func createTabController(vc: UIViewController, image: UIImage) -> UINavigationController {
      let tabController = UINavigationController(rootViewController: vc)
      tabController.tabBarItem.image = image
      tabController.tabBarItem.selectedImage = image
      return tabController
    }
    
    private func setImageTab(imageSystem: String) -> UIImage {
        let image = UIImage(systemName: imageSystem)!.withBaselineOffset(fromBottom: 16)
        return image
    }
}
