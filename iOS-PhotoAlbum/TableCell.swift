//
//  TableCell.swift
//  iOS-PhotoAlbum
//
//  Created by Sergey Myzin on 05.11.2021.
//

import UIKit

class TableCollectionViewCell: UICollectionViewCell {
    static let identifier = "TableCollectionViewCell"
    
    // MARK: - Elements
    let iconContainer: UIView = {
        let view = UIView()
        
        return view
    }()
    let iconView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemBackground
        image.tintColor = .systemBlue
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    let labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.numberOfLines = 1
        
        return label
    }()
    let labelAmount: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configurationContentOfCell(with model: TableCell) {
        labelTitle.text = model.title
        iconView.image = model.icon
        labelAmount.text = String(model.amount)
    }
    
    private func setupHierarchy() {
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconView)
        
        contentView.addSubview(labelTitle)
        contentView.addSubview(labelAmount)
        
    }
    
    // MARK: - Setup
    private func setupLayouts() {
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        iconContainer.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        iconContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        iconContainer.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        iconContainer.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor).isActive = true
        iconView.widthAnchor.constraint(equalTo:iconContainer.widthAnchor, constant: -15).isActive = true
        iconView.heightAnchor.constraint(equalTo:iconContainer.heightAnchor, constant: -15).isActive = true

        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true

        labelAmount.translatesAutoresizingMaskIntoConstraints = false
        labelAmount.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        labelAmount.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    }

}

