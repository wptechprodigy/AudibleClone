//
//  PageCell+Extensions.swift
//  Audible
//
//  Created by waheedCodes on 30/09/2020.
//  Copyright © 2020 waheedCodes. All rights reserved.
//

import UIKit

extension PageCell {
    
    func setupPageBackground(with imageView: UIImageView, topOf textView: UITextView)  {
        
        addSubview(imageView)
        addSubview(textView)
        
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        
    }
}

extension PageCell {
    
    func setupPageDescription(with textView: UITextView) {
        
        textView.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
    }
    
}

extension PageCell {
    
    func setUpASeparator(using lineSeparator: UIView, topOf textView: UITextView) {
        
        addSubview(lineSeparator)
        
        lineSeparator.anchorToTop(top: nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        
        lineSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
}
