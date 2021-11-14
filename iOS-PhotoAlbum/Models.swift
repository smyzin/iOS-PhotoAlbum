//
//  Models.swift
//  iOS-PhotoAlbum
//
//  Created by Sergey Myzin on 05.11.2021.
//

import UIKit

// MARK: - Enums
enum Icon {
    static let media = UIImage(systemName: "photo.fill.on.rectangle.fill")
    static let forYou = UIImage(systemName: "heart.text.square.fill")
    static let album = UIImage(systemName: "rectangle.stack.fill")
    static let search = UIImage(systemName: "magnifyingglass")
}

enum SettingsTypeCell {
    case albumCell(content: AlbumCell)
    case tableCell(content: TableCell)
}

// MARK: - Structs
// MARK: -- Model
struct Models {
    let typesSection: [SettingsTypeCell]
}

struct AlbumCell {
    let image: UIImage
    let title: String
    let amount: Int
}

struct TableCell {
    let icon: UIImage?
    let title: String
    let amount: Int
}

// MARK: - Section Layout struct
// MARK: -- Section
struct SectionAlbum {
    var item: ItemSectionOptions
    var group: GroupSectionOptions
    var section: SectionOptions
}

struct ItemSectionOptions {
    var height: CGFloat
    var width: CGFloat
    var table: Bool
}

struct GroupSectionOptions {
    var height: CGFloat
    var width: CGFloat
    var count: Int
}

struct SectionOptions {
    var top: CGFloat
    var leading: CGFloat
    var bottom: CGFloat
    var trailing: CGFloat
}

// MARK: - AlbumViewController extension
extension AlbumViewController {
    // MARK: -- Init model
    func configurationModels() {
        models.append(Models(typesSection: [
            .albumCell(content: AlbumCell(
                image: #imageLiteral(resourceName: "Recents"),
                title: "Recents",
                amount: 1_160)
            ),
            .albumCell(content: AlbumCell(
                image: #imageLiteral(resourceName: "Favorites"),
                title: "Favorites",
                amount: 28)
            ),
            .albumCell(content: AlbumCell(
                image: #imageLiteral(resourceName: "Instagram"),
                title: "Instagram",
                amount: 4)
            ),
            .albumCell(content: AlbumCell(
                image: #imageLiteral(resourceName: "WhatsApp"),
                title: "WhatsApp",
                amount: 25)
            ),
            .albumCell(content: AlbumCell(
                image: #imageLiteral(resourceName: "VSCO"),
                title: "VSCO",
                amount: 1)
            ),
            .albumCell(content: AlbumCell(
                image: #imageLiteral(resourceName: "Polarr"),
                title: "Polarr",
                amount: 9)
            ),
            .albumCell(content: AlbumCell(
                image: #imageLiteral(resourceName: "Lightroom"),
                title: "Lightroom",
                amount: 2)
            ),
            .albumCell(content: AlbumCell(
                image: #imageLiteral(resourceName: "Boomerang"),
                title: "Boomerang",
                amount: 46)
            )]
        ))
        models.append(Models(typesSection: [
            .albumCell(content: AlbumCell(
                image: #imageLiteral(resourceName: "People"),
                title: "People",
                amount: 4)
            ),
            .albumCell(content: AlbumCell(
                image: #imageLiteral(resourceName: "Map"),
                title: "Places",
                amount: 848)
            ),
            .albumCell(content: AlbumCell(
                image: #imageLiteral(resourceName: "Screenshots"),
                title: "Screenshots",
                amount: 452)
            ),
            .albumCell(content: AlbumCell(
                image: #imageLiteral(resourceName: "EyeEm"),
                title: "EyeEm",
                amount: 3)
            )]
        ))
        models.append(Models(typesSection: [
            .tableCell(content: TableCell(
                icon: UIImage(systemName: "video"),
                title: "Videos",
                amount: 115)
            ),
            .tableCell(content: TableCell(
                icon: UIImage(systemName: "person.crop.square"),
                title: "Selfies",
                amount: 56)
            ),
            .tableCell(content: TableCell(
                icon: UIImage(systemName: "livephoto"),
                title: "Live Photos",
                amount: 54)
            ),
            .tableCell(content: TableCell(
                icon: UIImage(systemName: "cube"),
                title: "Portrait",
                amount: 155)
            ),
            .tableCell(content: TableCell(
                icon: UIImage(systemName: "pano"),
                title: "Panoramas",
                amount: 3)
            ),
            .tableCell(content: TableCell(
                icon: UIImage(systemName: "camera.viewfinder"),
                title: "Screenshots",
                amount: 221)
            ),
            .tableCell(content: TableCell(
                icon: UIImage(systemName: "record.circle"),
                title: "Screen Recordings",
                amount: 2)
            ),
            .tableCell(content: TableCell(
                icon: UIImage(systemName: "rhombus"),
                title: "Animated",
                amount: 1)
            )]
        ))
        models.append(Models(typesSection: [
            .tableCell(content: TableCell(
                icon: UIImage(systemName: "square.and.arrow.down"),
                title: "Imports",
                amount: 27)
            ),
            .tableCell(content: TableCell(
                icon: UIImage(systemName: "eye.slash"),
                title: "Hidden",
                amount: 0)
            ),
            .tableCell(content: TableCell(
                icon: UIImage(systemName: "trash"),
                title: "Recently Deleted",
                amount: 75)
            )]
        ))
    }
    
    // MARK: -- Init Section
    func createAndConfigureSection(_ options: SectionAlbum) -> NSCollectionLayoutSection {
        let item = configureSectionItem(options: options.item)
        let group = configureSectionGroup(item, options: options.group)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: options.section.top,
            leading: options.section.leading,
            bottom: options.section.bottom,
            trailing: options.section.trailing
        )
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [configureSectionTitle()]
        return section
    }
    
    func configureSectionItem(options: ItemSectionOptions) -> NSCollectionLayoutItem {
        let size = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(options.width),
            heightDimension: options.table
                ? .absolute(view.frame.size.width * options.height) : .fractionalWidth(options.height)
        )
        let item = NSCollectionLayoutItem(layoutSize: size)
        item.contentInsets = options.table
            ? NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            : NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        return item
    }
    
    func configureSectionGroup(_ item: NSCollectionLayoutItem, options: GroupSectionOptions) -> NSCollectionLayoutGroup {
        let size = NSCollectionLayoutSize(
            widthDimension: .absolute(view.frame.size.width * options.width),
            heightDimension: .absolute(view.frame.size.width * options.height))
        let group = options.count > 0
            ? NSCollectionLayoutGroup.vertical(layoutSize: size, subitem: item, count: options.count)
            : NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        return group
    }
    
    func configureSectionTitle() -> NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(25))
        let title = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: size,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        title.contentInsets = NSDirectionalEdgeInsets(
            top: -10,
            leading: 0,
            bottom: 0,
            trailing: 0)
        title.pinToVisibleBounds = false
        title.zIndex = Int.max
        return title
    }
}

