//
//  ViewController.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import UIKit
import Combine
import Domain
import Core

public protocol HomeViewDelegate {
    func updateMeals(category: String)
}

public class HomeViewController: UIViewController, UITextFieldDelegate, HomeViewDelegate {
    
    @IBOutlet weak var tblHome: UITableView!
    
    enum TableSection: Int, CaseIterable {
        case header
        case filterMeals
        case titleSuggestion
        case mealsCard
        case titleRecommendFav
        case mealsCardFav
    }
    
    private var homeViewModel: HomeViewModel
    private var cancelable = Set<AnyCancellable>()
    private var categories = [MCategory]()
    private var meals = [Meal]()
    private var mealsFav = [Meal]()
    private var categoryFav: String? {
        didSet {
            homeViewModel.getMealsFav(category: categoryFav ?? "Beef")
        }
    }
    
    private var router: HomeRouteCase
    
    let refreshPage = UIRefreshControl()
    
    public init(homeViewModel: HomeViewModel, router: HomeRouteCase) {
        self.homeViewModel = homeViewModel
        self.router = router
        super.init(nibName: String(describing: HomeViewController.self), bundle: Bundle.current)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        reloadHomePage()
        observedValue()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func observedValue() {
        homeViewModel.categories
            .sink(receiveValue: { [weak self] value in
                self?.categories = value
                if self?.categoryFav == nil {
                    self?.categoryFav = value.randomElement()?.name
                }
                self?.tblHome.reloadRows(at: [IndexPath(row: 0, section: 1)], with: .left)
            }).store(in: &cancelable)
        
        homeViewModel.meals
            .sink(receiveValue: { [weak self] value in
                self?.meals = value
                self?.tblHome.reloadRows(at: [IndexPath(row: 0, section: 3)], with: .left)
            }).store(in: &cancelable)
        
        homeViewModel.mealsFav
            .sink(receiveValue: { [weak self] value in
                self?.mealsFav = value
                self?.tblHome.reloadRows(at: [IndexPath(row: 0, section: 5)], with: .left)
            }).store(in: &cancelable)
    }
    
    private func setupUI() {
        tblHome.keyboardDismissMode = .onDrag
        tblHome.addSubview(refreshPage)
        refreshPage.addTarget(self, action: #selector(onRefreshPage), for: .valueChanged)
        tblHome.dataSource = self
        tblHome.register(nibWithCellClass: HeaderHomeTableViewCell.self)
        tblHome.register(nibWithCellClass: TitleTableViewCell.self)
        tblHome.register(nibWithCellClass: MealsCardTableViewCell.self)
        tblHome.register(cellWithClass: FilterTableViewCell.self)
    }
    
    public func updateMeals(category: String) {
        homeViewModel.getMealsCategories(category: category)
    }
    
    private func reloadHomePage() {
        homeViewModel.getCategories()
        homeViewModel.getMealsCategories(category: "Beef")
    }
    
    @objc func onRefreshPage() {
        refreshPage.beginRefreshing()
        categoryFav = categories.randomElement()?.name
        reloadHomePage()
        refreshPage.endRefreshing()
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard when Return key is tapped
        textField.resignFirstResponder()
        return true
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        // Perform actions when the text field begins editing
        print("TextField did begin editing")
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        // Perform actions when the text field ends editing
        print("TextField did end editing")
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.allCases.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = TableSection(rawValue: indexPath.section)
        switch section {
        case .header:
            let cell: HeaderHomeTableViewCell = tableView.dequeueReusableCell(withClass: HeaderHomeTableViewCell.self)
            cell.searchText.delegate = self
            return cell
        case .filterMeals:
            let cell: FilterTableViewCell = tableView.dequeueReusableCell(withClass: FilterTableViewCell.self)
            cell.configure(with: categories)
            cell.homeViewDelegate = self
            return cell
        case .titleSuggestion:
            let cell: TitleTableViewCell = tableView.dequeueReusableCell(withClass: TitleTableViewCell.self)
            cell.configure(title: "Best for you", subTitle: "(Choose your Meals)")
            return cell
        case .mealsCard:
            let cell: MealsCardTableViewCell = tableView.dequeueReusableCell(withClass: MealsCardTableViewCell.self)
            cell.configure(with: meals)
            cell.mealClicked = { [weak self] meal in
                guard let self = self else { return }
                self.router.routeToDetail(from: self, withID: meal.idMeal ?? "0")
            }
            return cell
        case .titleRecommendFav:
            let cell: TitleTableViewCell = tableView.dequeueReusableCell(withClass: TitleTableViewCell.self)
            cell.configure(title: "Favorite", subTitle: "(Recommend)")
            return cell
        case .mealsCardFav:
            let cell: MealsCardTableViewCell = tableView.dequeueReusableCell(withClass: MealsCardTableViewCell.self)
            cell.configure(with: mealsFav)
            cell.mealClicked = { [weak self] meal in
                guard let self = self else { return }
                self.router.routeToDetail(from: self, withID: meal.idMeal ?? "0")
            }
            return cell
        case .none:
            return UITableViewCell()
        }
        
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}
