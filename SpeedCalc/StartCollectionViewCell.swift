//
//  StartCollectionViewCell.swift
//  SpeedCalc
//
//  Created by 二階堂 遍 on 2016/09/28.
//  Copyright © 2016年 二階堂 遍. All rights reserved.
//

import UIKit

final class StartCollectionViewCell: UICollectionViewCell {
        
    static let identifier = "start"
    static let nibName = "StartCollectionViewCell"
    
    @IBOutlet weak var text: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        // かどまる
        layer.cornerRadius = 3.0
        clipsToBounds = true
        
        // かげ
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 2.0
        layer.shadowColor = UIColor.black.cgColor
    }
}
