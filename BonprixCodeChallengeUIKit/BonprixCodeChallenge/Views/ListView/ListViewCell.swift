//
//  ListViewCell.swift
//  BonprixCodeChallenge
//
//  Created by Hannes Kühnel on 18.08.22.
//

import UIKit

class ListViewCell: UITableViewCell {
    static let identifier = "listViewCell"
    
    // MARK: - views
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .ubuntuRegular
        return label
    }()
    
    private let chevronRightImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        imageview.image = UIImage(systemName: "chevron.forward")
        imageview.tintColor = .black
        return imageview
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = ""
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
    }
    
    private func setupViews() {
        addSubviews([
            stackView,
        ])
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(chevronRightImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configuration
    func config(item: Category) {
        guard let itemLabel = item.label else { return }
        
        label.text = itemLabel
        chevronRightImageView.isHidden = (item.children ?? []).count == 0
    }
}
