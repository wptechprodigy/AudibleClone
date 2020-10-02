//
//  AudibleViewController+Extensions.swift
//  Audible
//
//  Created by waheedCodes on 01/10/2020.
//  Copyright © 2020 waheedCodes. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Collection view delegate

extension AudibleViewController: UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        
        pageScrollIndicator.currentPage = pageNumber
        
    }
    
}

// MARK: - Collection view datasource

extension AudibleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // When user scroll past the onboarding screens
        
        if indexPath.item == pages.count {
            
            let loginPage = collectionView.dequeueReusableCell(withReuseIdentifier: AudibleViewController.loginIdentifier, for: indexPath)
            
            return loginPage
            
        }
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AudibleViewController.identifier, for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}
