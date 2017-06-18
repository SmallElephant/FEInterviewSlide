//
//  Sort.swift
//  1-Algorithm
//
//  Created by keso on 2017/6/18.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class Sort {
    
    // 1.冒泡排序 平均时间复杂度O(n²) 最好时间复杂度O(n) 最差时间复杂度O(n²) 稳定排序算法
    
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
    
    // 2.选择排序 平均时间复杂度O(n²) 最好时间复杂度O(n²) 最差时间复杂度O(n²) 不稳定排序算法
    
    func select(arr:inout [Int]) {
        
        let count = arr.count
        for i in 0..<(count - 1) {
            for j in (i + 1)..<count {
                if arr[i] > arr[j] {
                    swap(&arr[i], &arr[j])
                }
            }
        }
        
    }
    
}
