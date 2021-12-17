//
//  MediaTypeCollectionViewCell.swift
//  HomeWork13
//
//  Created by Ольга on 17.12.2021.
//

import UIKit

class MediaTypeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var buttonImage: UIImageView!
    
    static let identifier = "MediaTypeCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MediaTypeCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with item: ListItem) {
        self.iconImage.image = item.icon
        self.textLabel.text = item.title
        self.numberLabel.text = item.number
        self.buttonImage.image = item.buttonIcon
    }

}
