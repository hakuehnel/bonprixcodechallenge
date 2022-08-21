//
//  StretchyTableHeaderView.swift
//  BonprixCodeChallenge
//
//  Created by Hannes Kühnel on 18.08.22.
//

// used from https://johncodeos.com/how-to-make-a-stretchy-header-in-ios-using-swift/ and refactored

import Foundation
import UIKit

class StretchyTableHeaderView: UIView {
    // MARK: - constraints
    private var imageViewHeight = NSLayoutConstraint()
    private var imageViewBottom = NSLayoutConstraint()
    private var containerViewHeight = NSLayoutConstraint()
    
    // MARK: - views
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createViews()
        setViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func createViews() {
        addSubview(containerView)
        containerView.addSubview(imageView)
    }
    
    private func setViewConstraints() {
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: heightAnchor)
        imageViewBottom = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        imageViewHeight = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        
        // UIView Constraints
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalTo: widthAnchor),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.heightAnchor.constraint(equalTo: heightAnchor),
            containerViewHeight,
            containerView.widthAnchor.constraint(equalTo: imageView.widthAnchor),
            
            imageViewBottom,
            imageViewHeight,
        ])
    }
    
    func loadImage(from url: URL) {
        imageView.lazyLoad(url: url, contentMode: .scaleAspectFill)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}
