//
//  Test.swift
//  2-Runtime
//
//  Created by FlyElephant on 2017/6/27.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import Foundation
import UIKit

class TestClass {
    
    var tBool:Bool = true
    
    var tInt:Int32 = 32
    
    var tFloat:Float = 72.5
    
    var tString:String = "FlyElephant"
    
    var tObject:AnyObject? = nil
    
    func tInterViewInfo() {
        
    }
    
}

class TestController:UIViewController {
    
    var tBool:Bool = true
    
    var tInt:Int32 = 32
    
    var tFloat:Float = 72.5
    
    var tString:String = "FlyElephant"
    
    var tObject:AnyObject? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    func tReturnVoid(view:UIView) {
        
    }
    
    func tReturnVoidWithBool(value:Bool) {
        
    }
    
    func tReturnTuple(boolValue:Bool) -> (String,Int) {
        return ("FlyElephant",100)
    }
    
    func tReturnVoidWithCharacter(aCharacter:Character) {
        
    }
    
    func tableView(tableView:UITableView) -> Int {
        return 10
    }
    
}
