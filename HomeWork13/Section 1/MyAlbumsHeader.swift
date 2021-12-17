//
//  MyAlbumsHeader.swift
//  HomeWork13
//
//  Created by Ольга on 17.12.2021.
//

import UIKit

class MyAlbumsHeader: UICollectionReusableView {
    
    static let identifier = "MyAlbumsHeader"
    
    private let headerLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Мои альбомы"
        lable.textAlignment = .left
        lable.font = .systemFont(ofSize: 22, weight: .semibold)
        lable.textColor = .black
        return lable
    }()
    
    private let buttonLabel: UILabel = {
        let lable = UILabel()
        lable.text = "См. все"
        lable.textAlignment = .right
        lable.font = .systemFont(ofSize: 17, weight: .regular)
        lable.textColor = .systemBlue
        return lable
    }()
    
    func configure() {
        
        addSubview(headerLabel)
        addSubview(buttonLabel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerLabel.frame = bounds
        buttonLabel.frame = bounds 
        
    }
        
}
