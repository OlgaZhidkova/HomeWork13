//
//  AlbumsViewController.swift
//  HomeWork13
//
//  Created by Ольга on 15.12.2021.
//

import UIKit

class AlbumsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayuot()
    )
    
    var firstSectionItems = [Item]()
    
    static let firstSectionID = "firstSectionID"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        configureFirstSection()
        
        collectionView.register(MyAlbumsCollectionViewCell.nib(), forCellWithReuseIdentifier: MyAlbumsCollectionViewCell.identifier)
        collectionView.register(MyAlbumsHeader.self, forSupplementaryViewOfKind: AlbumsViewController.firstSectionID, withReuseIdentifier: MyAlbumsHeader.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
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
    
    // MARK: - Settings
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    static func createLayuot() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection in
           
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
                NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: firstSectionID, alignment: .topLeading)
            ]
            
            section.contentInsets.leading = 20
            section.contentInsets.trailing = 20
            
            return section
        }
        return layout
    }
    
    // MARK: Data Sourse and Delegate methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return firstSectionItems.count
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCollectionViewCell.identifier, for: indexPath) as! MyAlbumsCollectionViewCell
        let item = firstSectionItems[indexPath.item]
        cell.configure(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: AlbumsViewController.firstSectionID, withReuseIdentifier: MyAlbumsHeader.identifier, for: indexPath) as! MyAlbumsHeader
        header.configure()
        return header
    }
}
