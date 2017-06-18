//
//  Search.swift
//  1-Algorithm
//
//  Created by keso on 2017/6/18.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation


class Search {
    
    // 1.二分查找
    
    func binarySearch(arr:[Int],num:Int) -> Int {
        
        var low = 0
        var high = arr.count - 1
        
        while low < high {
            let mid = (low + high) / 2
            if arr[mid] > num {
                high = mid - 1
            } else if arr[mid] < num {
                low = mid + 1
            } else {
                return mid
            }
        }
        
        return -1
    }
}
