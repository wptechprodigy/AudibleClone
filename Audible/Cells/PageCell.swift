//
//  PageCell.swift
//  Audible
//
//  Created by waheedCodes on 30/09/2020.
//  Copyright © 2020 waheedCodes. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        
        didSet {
            
            guard let page = page else {
                return
                
            }
            
            pageBgImage.image = UIImage(named: page.imageName)
            
            let color = UIColor(white: 0.2, alpha: 1)
            let titleFont = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
            
            let messageFont = UIFont.systemFont(ofSize: 14)
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font: titleFont, NSAttributedString.Key.foregroundColor: color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedString.Key.font: messageFont, NSAttributedString.Key.foregroundColor: color]))
            
            // Center the texts on the textView2
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            pageText.attributedText = attributedText
            
        }
    
    }
    
    let pageBgImage: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Page1")
        imageView.clipsToBounds = true
        
        return imageView
        
    }()
    
    let pageText: UITextView = {
       
        let textView = UITextView()
        textView.text = "Some dummy data for now!"
        textView.isEditable = false
        textView.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
        
        return textView
        
    }()
    
    let lineSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        return view
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupPageBackground(with: pageBgImage, topOf: pageText)
        setupPageDescription(with: pageText)
        setUpASeparator(using: lineSeparator, topOf: pageText)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
