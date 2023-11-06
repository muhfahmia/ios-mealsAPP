//
//  MealsDetailViewController.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 02/11/23.
//

import UIKit
import Combine
import SDWebImage

class MealDetailViewController: UIViewController {
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealTitle: UILabel!
    @IBOutlet weak var mealInstruction: UILabel!
    @IBOutlet weak var mealCategory: UILabel!
    @IBOutlet weak var mealArea: UILabel!
    @IBOutlet weak var mealBtnFav: UIButton!
    
    private var cancelable = Set<AnyCancellable>()
    private let detailViewModel: MealDetailViewModel
    private let mealID: String
    
    private var meal: Meal?
    
    init(viewModel: MealDetailViewModel, withID: String) {
        detailViewModel = viewModel
        mealID = withID
        super.init(nibName: "MealDetailView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBtn()
        detailViewModel.getMealDetail(withID: mealID)
        observedMeal()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.makeTransparent(withTint: .accentColor!)
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
    
    private func observedMeal() {
        detailViewModel.meal
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.meal = value
            self?.configureUI()
        }).store(in: &cancelable)
    }
    
    private func configureUI() {
        mealImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        mealImage.sd_setImage(with: URL(string: meal?.imageThumb ?? ""))
        mealTitle.text = meal?.name
        mealInstruction.text = meal?.instruction
        mealCategory.text = meal?.category
        mealArea.text = meal?.area
    }
    
    private func setupBtn() {
        mealBtnFav.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        mealBtnFav.addAction(UIAction(handler: { [weak self] _ in
            self?.mealBtnFav.isSelected = true
        }), for: .touchUpInside)
    }
    
}
