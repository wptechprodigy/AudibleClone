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
