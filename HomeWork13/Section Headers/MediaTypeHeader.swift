//
//  MediaTypeHeader.swift
//  HomeWork13
//
//  Created by Ольга on 17.12.2021.
//

import UIKit

class MediaTypeHeader: UICollectionReusableView {
    static let identifier = "MediaTypeHeader"
    
    private let headerLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Типы медиафайлов"
        lable.textAlignment = .left
        lable.font = .systemFont(ofSize: 22, weight: .semibold)
        lable.textColor = .black
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
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerLabel.frame = bounds
    }
}
