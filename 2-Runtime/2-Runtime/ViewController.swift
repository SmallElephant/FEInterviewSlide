//
//  ViewController.swift
//  2-Runtime
//
//  Created by FlyElephant on 2017/6/27.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

import UIKit

//struct Point{
//    var x:Double // 8 Bytes
//    var y:Double // 8 bytes
//    func draw(){
//        print("Draw point at\(x,y)")
//    }
//}

class Point{
    var x:Double // 8 Bytes
    var y:Double // 8 bytes
    init(x:Double,y:Double) {
        self.x = x
        self.y = y
    }
    func draw(){
        print("Draw point at\(x,y)")
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUp()
        setUp1()
        setUp2()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func fe_viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("FlyElephant_viewDidAppear方法交换")
    }
    
    dynamic func testMethod() {
        print("testMethod交换之前的执行")
    }
    
    dynamic func fe_testMethod() {
        print("fe_testMethod交换之后的执行")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    
    private func setUp() {
//        let point1 = Point(x: 5.0, y: 5.0)
//        point1.draw()
//        print("占用内存大小:\(MemoryLayout<Point>.size)") //16
        
        let point2 = Point(x: 5.0, y: 5.0)
        point2.draw()
        print(MemoryLayout<Point>.size) //8
    }
    
    private func setUp1() {
        
        let testClass:TestClass = TestClass()
        showClsRuntime(cls: object_getClass(testClass))
        print("\n")
        
        let testController:TestController = TestController()
        showClsRuntime(cls: object_getClass(testController))
    }
    
    private func setUp2() {
        methodSwizzle(cls: object_getClass(self), originalSelector: #selector(ViewController.viewDidAppear(_:)), swizzledSelector: #selector(ViewController.fe_viewDidAppear(_:)))
        methodSwizzle(cls: object_getClass(self), originalSelector: #selector(ViewController.testMethod), swizzledSelector: #selector(ViewController.fe_testMethod))
        testMethod()
    }
    
    func showClsRuntime(cls:AnyClass) {
        
        print("showClsRuntime--获取方法(FlyElephant)")
        
        var methodNum:UInt32 = 0
        
        let methodList = class_copyMethodList(cls, &methodNum)
        
        for index in 0..<numericCast(methodNum) {
            let method:Method = methodList![index]!
            
            print(String(utf8String: method_getTypeEncoding(method)) ?? " ",terminator: " ")
            print(String(utf8String: method_copyReturnType(method)) ?? " ",terminator: " ")
            print(String(_sel: method_getName(method)),terminator: " ")
            print("\n")
        }
        
         print("showClsRuntime--获取变量(FlyElephant)")
         var propertyNum:UInt32 = 0
         let propertyList = class_copyPropertyList(cls, &propertyNum)
        
        for index in 0..<numericCast(propertyNum) {
            let property:objc_property_t = propertyList![index]!
            print(String(utf8String: property_getName(property)) ?? " ",terminator: " ")
            print(String(utf8String: property_getAttributes(property)) ?? " ",terminator: " ")
            print("\n")
        }
        
    }
    
    
    func methodSwizzle(cls:AnyClass,originalSelector:Selector,swizzledSelector:Selector) {

        let originalMethod = class_getInstanceMethod(cls, originalSelector)
        let swizzledMethod = class_getInstanceMethod(cls, swizzledSelector)
        
        let didAddMethod = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }

}

