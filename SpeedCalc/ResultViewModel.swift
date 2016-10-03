//
//  Result.swift
//  SpeedCalc
//
//  Created by 二階堂 遍 on 2016/09/29.
//  Copyright © 2016年 二階堂 遍. All rights reserved.
//

import UIKit

final class ResultViewModel {
    var correct = 0
    
    func getRank() -> String {
        if correct > 25 {
            return getRankWithSubRank(rank: "S")
        }
        
        if correct > 20 {
            return getRankWithSubRank(rank: "A")
        }
        
        if correct > 15 {
            return getRankWithSubRank(rank: "B")
        }
        
        if correct > 10 {
            return getRankWithSubRank(rank: "C")
        }
        
        if correct > 5 {
            return getRankWithSubRank(rank: "D")
        }
        
        if correct > 0 {
            return getRankWithSubRank(rank: "E")
        }

        return "Z"
    }
    
    private func getRankWithSubRank(rank: String) -> String {
        return rank
    }
}
