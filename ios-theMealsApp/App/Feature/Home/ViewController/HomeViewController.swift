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
    }
    
    private var homeViewModel: HomeViewModel
    private var cancelable = Set<AnyCancellable>()
    private var categories = [MCategory]()
    private var meals = [Meal]()
    
    let refreshPage = UIRefreshControl()
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
        super.init(nibName: "HomeView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        reloadHomePage()
    }

    private func observedCategories() {
        homeViewModel.categories
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                self?.categories = value
                self?.tblHome.reloadRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
            }).store(in: &cancelable)
    }
    
    private func observedMeals() {
        homeViewModel.meals
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.meals = value
            self?.tblHome.reloadRows(at: [IndexPath(row: 0, section: 3)], with: .left)
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
        observedMeals()
    }
    
    private func reloadHomePage() {
        homeViewModel.getCategories()
        homeViewModel.getMealsCategories(category: "Beef")
        observedCategories()
        observedMeals()
    }
    
    @objc func onRefreshPage() {
        refreshPage.beginRefreshing()
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
            return cell
        case .titleRecommendFav:
            let cell: TitleTableViewCell = tableView.dequeueReusableCell(withClass: TitleTableViewCell.self)
            cell.configure(title: "Favorite", subTitle: "(Recommend)")
            return cell
        case .none:
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = TableSection(rawValue: section)
        switch section {
        case .header:
            return 1
        case .filterMeals:
            return 1
        case .titleSuggestion:
            return 1
        case .mealsCard:
            return 1
        case .titleRecommendFav:
            return 1
        case .none:
            return 0
        }
    }
    
}
