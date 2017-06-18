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
        setUpSearch()
        setUpString()
        setUpListNode()
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
        
        arr = [2, 3, 5, 1, 4, 9, 7]
        sort.quickSort(arr: &arr, low: 0, high: arr.count - 1)
        print("快速排序的结果:\(arr)")
        
        arr = [1, 3, 100, 20, 40, 60, 10, 9]
        sort.mergeSort(arr: &arr, low: 0, high: arr.count - 1)
        print("归并排序的结果:\(arr)")
    }
    
    private func setUpSearch() {
        let search = Search()
        let arr = [10, 20, 30, 40, 50, 60, 70]
        let index = search.binarySearch(arr: arr, num: 20)
        print("二分查找的索引:\(index)")
        
    }
    
    private func setUpString() {
        let mystring = MyString()
        let str = "I am FlyElephant"
        let result = mystring.reverseString(str: str)
        print("反转之后的字符串:\(result)")
    }
    
    private func setUpListNode() {
        
        let mylistNode = MyListNode()
        
        let headNode = ListNode()
        headNode.value = 10
        
        let node1 = ListNode()
        node1.value = 20
        
        let node2 = ListNode()
        node2.value = 30
        
        headNode.next = node1
        node1.next = node2
        
        var reverseHead = mylistNode.reverseNode(node: headNode)
        
        while reverseHead != nil {
            print("节点的值:\(reverseHead!.value!)")
            reverseHead = reverseHead?.next
        }
    }

}

