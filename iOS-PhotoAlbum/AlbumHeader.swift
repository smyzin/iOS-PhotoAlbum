//
//  AlbumHeader.swift
//  iOS-PhotoAlbum
//
//  Created by Sergey Myzin on 05.11.2021.
//

import UIKit

class AlbumHeader: UICollectionReusableView {
    static let id = "AlbumHeader"
    
    // MARK: - Elements
    private var leftLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()

    private  var rightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - Setup layout
    override func layoutSubviews() {
        super.layoutSubviews()
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        leftLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        leftLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        rightLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    // MARK: - Configure headers
    public func configureAlbumsHeaders(leftHeader: String, rightHeader: String) {
        backgroundColor = .systemBackground
        leftLabel.text = leftHeader
        rightLabel.text = rightHeader
        addSubview(leftLabel)
        addSubview(rightLabel)
    }

    public func configureDefaultHeader(_ leftHeader: String) {
        backgroundColor = .systemBackground
        leftLabel.text = leftHeader
        rightLabel.text = ""
        addSubview(leftLabel)
        addSubview(rightLabel)
    }
    
}

