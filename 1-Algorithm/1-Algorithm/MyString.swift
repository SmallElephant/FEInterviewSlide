//
//  MyString.swift
//  1-Algorithm
//
//  Created by keso on 2017/6/18.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class MyString {
    
    func reverse(arr:inout [Character],begin:Int,end:Int) {
        
        var low = begin
        var high = end
        
        while low < high {
            swap(&arr[low], &arr[high])
            low += 1
            high -= 1
        }
        
    }
    
    
    func reverseString(str:String) -> String {
        
        var arr = [Character](str.characters)
        
        reverse(arr: &arr, begin: 0, end: arr.count - 1)
        
        var begin = 0
        var end = 0
        for i in 0..<arr.count {
            end = i
            if String(arr[i]) == " " {
                reverse(arr: &arr, begin: begin, end: end - 1)
                begin = end + 1
            }
        }
        
        return String(arr)
    }
    
}
