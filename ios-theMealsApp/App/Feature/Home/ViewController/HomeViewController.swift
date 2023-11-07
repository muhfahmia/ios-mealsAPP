//
//  ViewController.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import UIKit
import Combine

protocol HomeViewDelegate {
    func updateMeals(category: String)
}

class HomeViewController: UIViewController, HomeViewDelegate {
    
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
    
    init(homeViewModel: HomeViewModel, router: HomeRouteCase) {
        self.homeViewModel = homeViewModel
        self.router = router
        super.init(nibName: "HomeView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        reloadHomePage()
        observedValue()
    }
    
    private func observedValue() {
        homeViewModel.categories
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.categories = value
            if self?.categoryFav == nil {
                self?.categoryFav = value.randomElement()?.name
            }
            self?.tblHome.reloadRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
        }).store(in: &cancelable)
        
        homeViewModel.meals
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.meals = value
            self?.tblHome.reloadRows(at: [IndexPath(row: 0, section: 3)], with: .left)
        }).store(in: &cancelable)
        
        homeViewModel.mealsFav
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.mealsFav = value
            self?.tblHome.reloadRows(at: [IndexPath(row: 0, section: 5)], with: .left)
        }).store(in: &cancelable)
    }
 
    private func setupUI() {
        tblHome.addSubview(refreshPage)
        refreshPage.addTarget(self, action: #selector(onRefreshPage), for: .valueChanged)
        tblHome.dataSource = self
        tblHome.register(nib: UINib(nibName: "HeaderHomeTableViewCell", bundle: nil), withCellClass: HeaderHomeTableViewCell.self)
        tblHome.register(cellWithClass: FilterTableViewCell.self)
        tblHome.register(nib: UINib(nibName: "TitleTableViewCell", bundle: nil), withCellClass: TitleTableViewCell.self)
        tblHome.register(nib: UINib(nibName: "MealsCardTableViewCell", bundle: nibBundle), withCellClass: MealsCardTableViewCell.self)
    }
    
    func updateMeals(category: String) {
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
    
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = TableSection(rawValue: indexPath.section)
        switch section {
        case .header:
            let cell: HeaderHomeTableViewCell = tableView.dequeueReusableCell(withClass: HeaderHomeTableViewCell.self)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}
