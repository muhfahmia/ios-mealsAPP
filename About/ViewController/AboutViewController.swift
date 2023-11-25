//
//  AboutViewController.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 08/11/23.
//

import UIKit
import Core

public class AboutViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    let image = UIImage(nameOrSystemName: "fahmiProfile")
    
    public init() {
        super.init(nibName: String(describing: AboutViewController.self), bundle: Bundle.current)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.image = image
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
}
