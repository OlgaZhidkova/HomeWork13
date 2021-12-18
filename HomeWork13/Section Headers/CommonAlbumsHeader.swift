//
//  CommonAlbumsHeader.swift
//  HomeWork13
//
//  Created by Ольга on 17.12.2021.
//

import UIKit

class CommonAlbumsHeader: UICollectionReusableView {
    
    static let identifier = "CommonAlbumsHeader"
    
    private let headerLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Общие альбомы"
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
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.frame.size.width = 400
        view.frame.size.height = 0.2
        return view
    }()
    
    func configure() {
        addSubview(separator)
        addSubview(headerLabel)
        addSubview(buttonLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerLabel.frame = bounds
        buttonLabel.frame = bounds
    }
}
