//
//  FavoriteViewController.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 22/10/23.
//

import UIKit
import Combine
import Domain
import Utils

public class FavoriteViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var favCL: UICollectionView!
    @IBOutlet weak var favMessage: UIStackView!
    
    private let favViewModel: FavoriteViewModel
    private let favRouter: FavoriteRouteCase
    private var cancelable = Set<AnyCancellable>()
    private var meals: [Meal]?
    
    init(viewModel: FavoriteViewModel, router: FavoriteRouteCase) {
        favViewModel = viewModel
        favRouter = router
        super.init(nibName: String(describing: FavoriteViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        favViewModel.getMeals()
        observedValue()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favViewModel.getMeals()
        self.navigationItem.title = "Meals Favorite"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupUI() {
        favCL.dataSource = self
        favCL.delegate = self
        favCL.register(nibWithCellClass: MealsCardCollectionViewCell.self)
    }
    
    private func observedValue() {
        favViewModel.meals
        .sink(receiveValue: { [weak self] value in
            self?.meals = value
            if self?.meals?.isEmpty == true {
                self?.favCL.isHidden = true
                self?.favMessage.isHidden = false
            } else {
                self?.favCL.isHidden = false
                self?.favMessage.isHidden = true
            }
            self?.favCL.reloadData()
        }).store(in: &cancelable)
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        meals?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell: MealFavCollectionViewCell = collectionView.dequeueReusableCell(withClass: MealFavCollectionViewCell.self, for: indexPath)
        let meal = meals?[indexPath.item]
        cell.configure(with: meal!)
        cell.delAction = { [weak self] meal in
            guard let self = self else { return }
            favViewModel.deleteMeal(with: meal)
            favViewModel.getMeals()
        }
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let meal = meals?[indexPath.item]
        favRouter.routeToDetail(from: self, withID: meal?.idMeal ?? "")
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.bounds.width - 10 - 10
        let itemWidth = (availableWidth - (2 - 1) * 10) / 2
        let itemHeight = itemWidth * 1.32
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
