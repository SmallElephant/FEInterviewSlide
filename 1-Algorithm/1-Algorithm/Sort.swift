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
    
    // 3.快速排序 平均时间复杂度O(nlog2n) 最好时间复杂度O(nlog2n) 最差时间复杂度O(n²) 不稳定排序算法
    
    func quickSort(arr:inout [Int],low:Int,high:Int) {
        
        if low > high {
            return
        }
        
        let mid = partition(arr: &arr, low: low, high: high)
        quickSort(arr: &arr, low: low, high: mid - 1)
        quickSort(arr: &arr, low: mid + 1, high: high)
    }
    
    private func partition(arr:inout [Int],low:Int,high:Int) -> Int {
        
        var index = low
        let pivot = arr[high]
        
        for i in low...high {
            
            if arr[i] < pivot {
                if index != i {
                    swap(&arr[index], &arr[i])
                }
                index += 1
            }
        }
        
        if  index != high {
            swap(&arr[index], &arr[high])
        }
        
        return index
    }
    
    // 4.归并排序 平均时间复杂度O(nlog2n) 最好时间复杂度O(nlog2n) 最差时间复杂度O(nlog2n) 稳定排序算法
    
    func mergeSort(arr:inout [Int],low:Int,high:Int) {
        if low >= high {
            return
        }
        
        let mid = (low + high) / 2
        mergeSort(arr: &arr, low: low, high: mid)
        mergeSort(arr: &arr, low: mid + 1, high: high)
        merge(arr: &arr, low: low, mid: mid, high: high)
    }
    
    
    private func merge(arr:inout [Int],low:Int,mid:Int,high:Int) {
        
        let count = high - low + 1
        
        var temp = [Int].init(repeating: 0, count: count)
        
        
        var left = low
        var right = mid + 1
        var index = 0
        
        while left <= mid && right <= high {
            
            if arr[left] < arr[right] {
                temp[index] = arr[left]
                left += 1
            } else {
                temp[index] = arr[right]
                right += 1
            }
            index += 1
        }
        
        while left <= mid {
            temp[index] = arr[left]
            left += 1
            index += 1
        }
        
        while right <= high {
            temp[index] = arr[right]
            right += 1
            index += 1
        }
        
        for i in 0..<count {
            arr[low + i] = temp[i]
        }
        
    }
    
    
    
}
