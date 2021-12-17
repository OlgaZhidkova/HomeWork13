//
//  AlbumsViewController.swift
//  HomeWork13
//
//  Created by Ольга on 15.12.2021.
//

import UIKit

class AlbumsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    var collectionView: UICollectionView! 
    
    var firstSectionItems = [Item]()
    var secondSectionItems = [Item]()
    var thirdSectionItems = [ListItem]()
    
    static let firstSectionID = "firstSectionID"
    static let secondSectionID = "secondSectionID"
    static let thirdSectionID = "thirdSectionID"
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        
        configureFirstSection()
        configureSecondSection()
        configureThirdSection()
        
        collectionView.register(MyAlbumsCollectionViewCell.nib(), forCellWithReuseIdentifier: MyAlbumsCollectionViewCell.identifier)
        collectionView.register(MediaTypeCollectionViewCell.nib(), forCellWithReuseIdentifier: MediaTypeCollectionViewCell.identifier)
        
        collectionView.register(MyAlbumsHeader.self, forSupplementaryViewOfKind: AlbumsViewController.firstSectionID, withReuseIdentifier: MyAlbumsHeader.identifier)
        collectionView.register(CommonAlbumsHeader.self, forSupplementaryViewOfKind: AlbumsViewController.secondSectionID, withReuseIdentifier: CommonAlbumsHeader.identifier)
        collectionView.register(MediaTypeHeader.self, forSupplementaryViewOfKind: AlbumsViewController.thirdSectionID, withReuseIdentifier: MediaTypeHeader.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - Configure
    
    func configureFirstSection() {
        firstSectionItems.append(Item(text: "Недавние", imageName: "image_1", number: "1 234"))
        firstSectionItems.append(Item(text: "Избранное", imageName: "image_2", number: "234"))
        firstSectionItems.append(Item(text: "WhatsApp", imageName: "image_3", number: "1 089"))
        firstSectionItems.append(Item(text: "Instagram", imageName: "image_4", number: "215"))
        firstSectionItems.append(Item(text: "Фото", imageName: "image_5", number: "2 078"))
        firstSectionItems.append(Item(text: "Путешествия", imageName: "image_6", number: "346"))
        firstSectionItems.append(Item(text: "Обои", imageName: "image_7", number: "10"))
        firstSectionItems.append(Item(text: "Фотосессия", imageName: "image_8", number: "35"))
    }
    
    func configureSecondSection() {
        secondSectionItems.append(Item(text: "Дом", imageName: "image_5", number: "28"))
        secondSectionItems.append(Item(text: "Природа", imageName: "image_6", number: "36"))
        secondSectionItems.append(Item(text: "Город", imageName: "image_7", number: "10"))
        secondSectionItems.append(Item(text: "Зима", imageName: "image_8", number: "15"))
    }
    
    func configureThirdSection() {
        thirdSectionItems.append(ListItem(title: "Видео", icon: UIImage(systemName: "video"), number: "167", buttonIcon: UIImage(systemName: "chevron.right")))
        thirdSectionItems.append(ListItem(title: "Селфи", icon: UIImage(systemName: "person.crop.square"), number: "160", buttonIcon: UIImage(systemName: "chevron.right")))
        thirdSectionItems.append(ListItem(title: "Фото Live Photos", icon: UIImage(systemName: "camera.aperture"), number: "1796", buttonIcon: UIImage(systemName: "chevron.right")))
        thirdSectionItems.append(ListItem(title: "Портреты", icon: UIImage(systemName: "cube"), number: "16", buttonIcon: UIImage(systemName: "chevron.right")))
        thirdSectionItems.append(ListItem(title: "Серии", icon: UIImage(systemName: "square.stack.3d.down.right"), number: "5", buttonIcon: UIImage(systemName: "chevron.right")))
        thirdSectionItems.append(ListItem(title: "Снимки экрана", icon: UIImage(systemName: "camera.viewfinder"), number: "119", buttonIcon: UIImage(systemName: "chevron.right")))
    }
    
    // MARK: - Settings
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayuot())
        collectionView.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    // MARK: - Sections
    
    enum Sections: Int {
        case first = 0
        case second = 1
        case third = 2
    }
    
    private func firstSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(190),
                heightDimension: .absolute(460)
            ),
            subitem: item,
            count: 2
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: AlbumsViewController.firstSectionID, alignment: .topLeading)
        ]
        section.contentInsets.leading = 20
        section.contentInsets.trailing = 20
        
        return section
    }
    
    private func secondSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(190),
                heightDimension: .absolute(230)
            ),
            subitem: item,
            count: 1
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: AlbumsViewController.secondSectionID, alignment: .topLeading)
        ]
        section.contentInsets.leading = 20
        section.contentInsets.trailing = 20
        return section
    }
    
    private func thirdSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
            )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(45)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: AlbumsViewController.thirdSectionID, alignment: .topLeading)
        ]
        section.contentInsets.leading = 20
        section.contentInsets.trailing = 20
        return section
    }
    
    // MARK: - Layout
    
    private func createLayuot() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            
            switch Sections(rawValue: sectionIndex) {
            case .first:
                return self.firstSection()
            case .second:
                return self.secondSection()
            case .third:
                return self.thirdSection()
            default:
                return nil
            }
        }
        return layout
    }
    
    // MARK: - Data Sourse and Delegate methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfItems: Int = Int()
        if section == 0 {
            numberOfItems = firstSectionItems.count
        } else if section == 1 {
            numberOfItems = secondSectionItems.count
        } else if section == 2 {
            numberOfItems = thirdSectionItems.count
        }
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCollectionViewCell.identifier, for: indexPath) as! MyAlbumsCollectionViewCell
            let item = firstSectionItems[indexPath.item]
            cell.configure(with: item)
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCollectionViewCell.identifier, for: indexPath) as! MyAlbumsCollectionViewCell
            let item = secondSectionItems[indexPath.item]
            cell.configure(with: item)
            return cell
        } else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaTypeCollectionViewCell.identifier, for: indexPath) as! MediaTypeCollectionViewCell
            let item = thirdSectionItems[indexPath.item]
            cell.configure(with: item)
            return cell
        }
       return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = UICollectionReusableView()
        if indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: AlbumsViewController.firstSectionID, withReuseIdentifier: MyAlbumsHeader.identifier, for: indexPath) as! MyAlbumsHeader
            header.configure()
            return header
        } else if indexPath.section == 1 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: AlbumsViewController.secondSectionID, withReuseIdentifier: CommonAlbumsHeader.identifier, for: indexPath) as! CommonAlbumsHeader
            header.configure()
            return header
        } else if indexPath.section == 2 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: AlbumsViewController.thirdSectionID, withReuseIdentifier: MediaTypeHeader.identifier, for: indexPath) as! MediaTypeHeader
            header.configure()
            return header
        }
        return header
    }
}
