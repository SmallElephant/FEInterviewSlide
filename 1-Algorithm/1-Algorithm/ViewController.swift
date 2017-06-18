//
//  ViewController.swift
//  1-Algorithm
//
//  Created by keso on 2017/6/18.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    private func setUp() {
        
        let sort = Sort()
        var arr = [10, 8, 1, 2, 7, 5, 6, 18, 24]
        sort.bubbleSort(arr: &arr)
        print("冒泡排序的结果:\(arr)")
        
        arr = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10]
        sort.select(arr: &arr)
        print("选择排序的结果:\(arr)")
        
    }

}

