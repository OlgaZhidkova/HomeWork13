//
//  MyAlbumsCollectionViewCell.swift
//  HW13
//
//  Created by Ольга on 13.12.2021.
//

import UIKit

class MyAlbumsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyAlbumsCollectionViewCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "MyAlbumsCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with item: Item) {
        self.imageView.image = UIImage(named: item.imageName)
        self.imageView.layer.cornerRadius = 5
        self.textLabel.text = item.text
        self.numberLabel.text = item.number
    }
}
