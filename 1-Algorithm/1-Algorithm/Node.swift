//
//  Node.swift
//  1-Algorithm
//
//  Created by keso on 2017/6/18.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation

class ListNode {
    
    var value:Int?
    
    var next:ListNode?
}

class MyListNode {
    
    func reverseNode(node:ListNode) -> ListNode? {
        
        var reveseHead:ListNode?
        var headNode:ListNode? = node
        var preNode:ListNode?
        
        while headNode != nil {
            let next = headNode?.next
            if next == nil {
                reveseHead = headNode
                reveseHead?.next = preNode
            } else {
                headNode?.next = preNode
                preNode = headNode
            }
            
            headNode = next
        }
        
        return reveseHead!
    }
    
}
