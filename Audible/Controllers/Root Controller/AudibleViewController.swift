//
//  AudibleViewController.swift
//  Audible
//
//  Created by waheedCodes on 29/09/2020.
//  Copyright © 2020 waheedCodes. All rights reserved.
//

import UIKit

class AudibleViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "CellIdentifier"
    static let loginIdentifier = "loginIdentifier"
    
    let pages: [Page] = {
        
        let firstPage = Page(title: "Share a great listen", message: "It's free to send your books to the people in your life. Every recipient's first book is on us.", imageName: "Page1")
        
        let secondPage = Page(title: "Share from your library", message: "Tap the More menu next to any book. Choose \"Send this Book\"", imageName: "Page2")
        
        let thirdPage = Page(title: "Send from the player", message: "Tap the More menu next to any book. Choose \"Send this Book\"", imageName: "Page3")
        
        return [firstPage, secondPage, thirdPage]
    }()
    
    lazy var onBoardingCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
        
    }()
    
    lazy var pageScrollIndicator: UIPageControl = {
        
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPageIndicatorTintColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
        pageControl.numberOfPages = self.pages.count + 1
        
        return pageControl
        
    }()
    
    let skipNavigation: UIButton = {
        
        let skipButton = UIButton()
        skipButton.setTitle("Skip", for: .normal)
        skipButton.setTitleColor(UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1), for: .normal)
        
        return skipButton
        
    }()
    
    let nextNavigation: UIButton = {
        
        let nextButton = UIButton()
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1), for: .normal)
        
        return nextButton
        
    }()
    
    var pageControlBottomAnchor: NSLayoutConstraint?
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonTopAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(onBoardingCollectionView)
        view.addSubview(pageScrollIndicator)
        view.addSubview(skipNavigation)
        view.addSubview(nextNavigation)
        
        // Accesses the bottomAnchor
        pageControlBottomAnchor = pageScrollIndicator.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)[1]
        
        skipButtonTopAnchor = skipNavigation.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50).first
        
        nextButtonTopAnchor = nextNavigation.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50).first
        
        onBoardingCollectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        // Register the collection view cells
         registerCells()
        
    }
    
    fileprivate func registerCells() {
        
        onBoardingCollectionView.register(PageCell.self, forCellWithReuseIdentifier: AudibleViewController.identifier)
        
        onBoardingCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: AudibleViewController.loginIdentifier)
    }
    
}
