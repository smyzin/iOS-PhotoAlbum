//
//  AlbumCell.swift
//  iOS-PhotoAlbum
//
//  Created by Sergey Myzin on 05.11.2021.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    static let identifier = "AlbumCollectionViewCell"
    
    // MARK: - Elements
    public let albumImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .label
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 6
        return image
    }()
    
    public let albumTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .label
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    public let albumAmount: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayouts()
    }
    
    // MARK: - Init
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupHierarchy() {
        contentView.clipsToBounds = true
        contentView.addSubview(albumImage)
        contentView.addSubview(albumTitle)
        contentView.addSubview(albumAmount)
    }
    
    public func configurationContentOfCell(with model: AlbumCell) {
        albumImage.image = model.image
        albumTitle.text = model.title
        albumAmount.text = String(model.amount)
    }
    
    // MARK: - Setup
    private func setupLayouts() {
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        albumImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        albumImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        albumImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor).isActive = true
        
        albumTitle.translatesAutoresizingMaskIntoConstraints = false
        albumTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        albumTitle.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 10).isActive = true
        
        albumAmount.translatesAutoresizingMaskIntoConstraints = false
        albumAmount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        albumAmount.topAnchor.constraint(equalTo: albumTitle.bottomAnchor).isActive = true
    }
        
}
