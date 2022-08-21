//
//  AssortmentTableViewCell.swift
//  BonprixCodeChallenge
//
//  Created by Hannes Kühnel on 17.08.22.
//

import UIKit

class AssortmentTableViewCell: UITableViewCell {
    static let identifier = "assortmentTableViewCell"
    
    // MARK: - views
    private let teaserImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    private let overlayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .init(white: 1, alpha: 0.8)
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        teaserImageView.image = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubviews([
            teaserImageView,
            overlayLabel,
        ])
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            teaserImageView.topAnchor.constraint(equalTo: topAnchor),
            teaserImageView.leftAnchor.constraint(equalTo: leftAnchor),
            teaserImageView.rightAnchor.constraint(equalTo: rightAnchor),
            teaserImageView.heightAnchor.constraint(equalToConstant: 198),
            
            overlayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            overlayLabel.heightAnchor.constraint(equalToConstant: 44),
            overlayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configuration
    func config(item: Category) {
        guard let label = item.label,
              let image = item.image,
              let imageUrl = URL(string: image) else { return }
        
        teaserImageView.lazyLoad(url: imageUrl, contentMode: .scaleAspectFill)
        
        // fake horizontal padding for an UILabel
        overlayLabel.text = "  \(label)  "
    }
}
