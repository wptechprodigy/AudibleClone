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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(onBoardingCollectionView)
        
        onBoardingCollectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        // Register the collection view cell
        onBoardingCollectionView.register(PageCell.self, forCellWithReuseIdentifier: AudibleViewController.identifier)
    }
    
}

// MARK: - Collection view delegate

extension AudibleViewController: UICollectionViewDelegate {
    
}

// MARK: - Collection view datasource

extension AudibleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AudibleViewController.identifier, for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
