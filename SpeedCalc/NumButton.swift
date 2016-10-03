//
//  NumButton.swift
//  SpeedCalc
//
//  Created by 二階堂 遍 on 2016/09/25.
//  Copyright © 2016年 二階堂 遍. All rights reserved.
//

import UIKit

final class NumButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isExclusiveTouch = true
    }
}
