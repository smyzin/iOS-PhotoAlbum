//
//  AlbumViewController.swift
//  iOS-PhotoAlbum
//
//  Created by Sergey Myzin on 05.11.2021.
//

import UIKit

class AlbumViewController: UIViewController {
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Albums"
        view.addSubview(collectionView)
        configureCollectionView()
        configurationModels()
    }
    
    // MARK: - Variables
    var models = [Models]()
    
    private let sectionAlbums = SectionAlbum(
        item: ItemSectionOptions(height: 0.95, width: 0.95, table: false),
        group: GroupSectionOptions(height: 1.25, width: 0.5, count: 2),
        section: SectionOptions(top: 0, leading: 5, bottom: 0, trailing: 5)
    )
    private let sectionByPlacesAndGroups = SectionAlbum(
        item: ItemSectionOptions(height: 1, width: 1, table: false),
        group: GroupSectionOptions(height: 0.72, width: 0.47, count: 1),
        section: SectionOptions(top: 0, leading: 15, bottom: 0, trailing: 15)
    )
    private let sectionMediaTypes = SectionAlbum(
        item: ItemSectionOptions(height: 0.1, width: 1, table: true),
        group: GroupSectionOptions(height: 0.87, width: 1, count: 0),
        section: SectionOptions(top: 0, leading: 0, bottom: 0, trailing: 0)
    )
    private let sectionUtilities = SectionAlbum(
        item: ItemSectionOptions(height: 0.1, width: 1, table: true),
        group: GroupSectionOptions(height: 0.37, width: 1, count: 0),
        section: SectionOptions(top: 0, leading: 0, bottom: 0, trailing: 0)
    )
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return collectionView
    }()
    
    // MARK: - Configure CollectionView & Sections Layout
    private func configureCollectionView() {
        collectionView.reloadData()
        collectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.identifier)
        collectionView.register(TableCollectionViewCell.self, forCellWithReuseIdentifier: TableCollectionViewCell.identifier)
        collectionView.register(AlbumHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AlbumHeader.id)
        collectionView.collectionViewLayout = generateSectionsLayout()
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        collectionView.dataSource = self
        collectionView.delegate = self
    }
        
    func generateSectionsLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0: return self.createAndConfigureSection(self.sectionAlbums)
            case 1: return self.createAndConfigureSection(self.sectionByPlacesAndGroups)
            case 2: return self.createAndConfigureSection(self.sectionMediaTypes)
            default: return self.createAndConfigureSection(self.sectionUtilities)
            }
        }
    }
    
    // MARK: - Configure
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AlbumHeader.id, for: indexPath) as! AlbumHeader
        
        let section = indexPath.section
        
        switch (section) {
        case 0: header.configureAlbumsHeaders(leftHeader: "My Albums", rightHeader: "See All")
            return header
        case 1: header.configureDefaultHeader("People & Places")
            return header
        case 2: header.configureDefaultHeader("Media Types")
            return header
        case 3: header.configureDefaultHeader("Utilities")
            return header
        default: return UICollectionReusableView()
        }
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension AlbumViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models[section].typesSection.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.section].typesSection[indexPath.row]
        switch model.self {
        case .albumCell(content: let content):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.identifier, for: indexPath) as? AlbumCollectionViewCell else {
                fatalError()
            }
            cell.configurationContentOfCell(with: content)
            cell.contentView.backgroundColor = .clear
            return cell
            
        case .tableCell(content: let content):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.identifier, for: indexPath) as? TableCollectionViewCell else {
                fatalError()
            }
            cell.configurationContentOfCell(with: content)
            cell.contentView.backgroundColor = .clear
            return cell
        }
    }
}
