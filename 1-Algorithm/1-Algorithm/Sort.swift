//
//  Sort.swift
//  1-Algorithm
//
//  Created by keso on 2017/6/18.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Sort {
    
    // 冒泡排序
    
    func bubbleSort(arr:inout [Int]) {
        
        let count = arr.count
        for i in 0..<count {
            for j in 0..<(count - i - 1) {
                if arr[j]  > arr[j + 1] {
                    swap(&arr[j], &arr[j + 1])
                }
            }
        }
        
    }
    
}
