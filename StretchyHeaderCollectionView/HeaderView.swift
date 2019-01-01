//
//  HeaderView.swift
//  StretchyHeaderCollectionView
//
//  Created by SEAN on 2018/12/30.
//  Copyright © 2018 SEAN. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "photo")
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.fillSuperview()
    
        setupVisualEffectBlur()
    }
    
    var animator: UIViewPropertyAnimator!
    
    private func setupVisualEffectBlur(){
        animator = UIViewPropertyAnimator(duration: 3, curve: .linear, animations: { [weak self] in
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
        })
                
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
