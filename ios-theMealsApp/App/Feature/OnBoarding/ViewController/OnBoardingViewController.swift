//
//  OnBoardingViewController.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    @IBOutlet weak var boardCollectionView: UICollectionView!
    @IBOutlet weak var boardPageControl: UIPageControl!
    @IBOutlet weak var boardTitle: UILabel!
    @IBOutlet weak var boardDesc: UILabel!
    
    let boarding: [Boarding] = [
        Boarding(viewAnimate: "boarding-1", title: "Welcome to Meals App", desc: "This application is intended for those of you who are looking for delicious and healthy food"),
        Boarding(viewAnimate: "boarding-2", title: "Handmade by Fahmi", desc: "Delicious food is the result of a Great Chef"),
        Boarding(viewAnimate: "boarding-3", title: "Find your Favorite", desc: "There are various kinds of food choices in this application. Come on, find your favorite food"),
    ]
    
    init() {
        super.init(nibName: "OnBoardView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBoard()
        setupCellRegister()
        setupBoard(with: 0)
    }
    
    func setupBoard() {
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.scrollDirection = .horizontal
        boardCollectionView.dataSource = self
        boardCollectionView.delegate = self
        boardCollectionView.showsHorizontalScrollIndicator = false
        boardCollectionView.isPagingEnabled = true
        boardCollectionView.collectionViewLayout = cvLayout
        boardPageControl.numberOfPages = boarding.count
    }
    
    func setupCellRegister() {
        boardCollectionView.register(UINib(nibName: "OnBoardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "onBoardCell")
    }
    
    @IBAction func boardAction(_ sender: Any) {
        let indexPage = Int(boardCollectionView.contentOffset.x / boardCollectionView.frame.width) + 1
        let indexPath = IndexPath(row: indexPage, section: 0)
        
        if indexPage == boarding.endIndex {
            setupBoard(with: 0)
            boardCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: true)
        } else {
            setupBoard(with: indexPage)
            boardCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        
        
        
        print("nextPage: \(indexPage) endIndex: \(boarding.endIndex)")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let indexPage = Int(boardCollectionView.contentOffset.x / scrollView.frame.size.height)
        setupBoard(with: indexPage)
    }
    
    func setupBoard(with page: Int) {
        print("page: \(page)")
        boardPageControl.currentPage = page
        boardTitle.text = boarding[page].title
        boardDesc.text = boarding[page].desc
    }
}

extension OnBoardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = boardCollectionView.dequeueReusableCell(withReuseIdentifier: "onBoardCell", for: indexPath) as! OnBoardingCollectionViewCell
        let board = boarding[indexPath.item]
        cell.board = board
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boarding.count
    }
    
}

extension OnBoardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: boardCollectionView.bounds.width, height: boardCollectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
