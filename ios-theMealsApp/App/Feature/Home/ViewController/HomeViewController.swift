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
    }
    
    private var homeViewModel: HomeViewModel
    private var cancelable = Set<AnyCancellable>()
    private var categories = [MCategory]()
    private var meals = [Meal]()
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
        super.init(nibName: "HomeView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Phone Bound Frame: \(self.view.bounds)")
        setupUI()
        setupMeals(category: "Beef")
        setupCategories()
        // Do any additional setup after loading the view.
    }
    
    func setupCategories() {
        homeViewModel.getCategories()
        homeViewModel.categories
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                self?.categories = value
                self?.tblHome.reloadData()
            }).store(in: &cancelable)
    }
    
    func setupMeals(category: String) {
        homeViewModel.getMealsCategories(category: category)
        homeViewModel.meals
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.meals = value
            self?.tblHome.reloadData()
        }).store(in: &cancelable)
    }
 
    func setupUI() {
        tblHome.dataSource = self
        tblHome.register(UINib(nibName: "HeaderHomeTableViewCell", bundle: nil), forCellReuseIdentifier: "headerHomeCell")
        tblHome.register(UINib(nibName: "FilterCell", bundle: nil), forCellReuseIdentifier: "filterCell")
        tblHome.register(UINib(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: "titleCell")
        tblHome.register(UINib(nibName: "MealsCardTableViewCell", bundle: nil), forCellReuseIdentifier: "mealsCardCell")
    }
    
    func updateMeals(category: String) {
        print("updateMeals \(category)")
        setupMeals(category: category)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerHomeCell", for: indexPath) as? HeaderHomeTableViewCell
            return cell!
        case .filterMeals:
            let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as? FilterTableViewCell
            cell?.configure(with: categories)
            cell?.homeViewDelegate = self
            return cell!
        case .titleSuggestion:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as? TitleTableViewCell
            return cell!
        case .mealsCard:
            let cell = tableView.dequeueReusableCell(withIdentifier: "mealsCardCell", for: indexPath) as? MealsCardTableViewCell
            cell?.configure(with: meals)
            return cell!
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
        case .none:
            return 0
        }
    }
    
}
