//
//  FoodCollectionViewCell.swift
//  Onban
//
//  Created by ilim on 2023/04/25.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodThumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var normalPrice: UILabel!
    @IBOutlet weak var salePrice: UILabel!
    
    @IBOutlet weak var badge: UIStackView!
}
