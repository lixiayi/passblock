//
//  Second.swift
//  passblock
//
//  Created by xiaoyi li on 17/1/13.
//  Copyright © 2017年 xiaoyi li. All rights reserved.
//

import UIKit

typealias PassBlock = (_ v:String) ->Void
typealias PassDicBlock = (_ v:Dictionary<String,Any>) ->Void
typealias passArrBlock = (_ v:Array<String>) ->Void

class Second: UIViewController {
    
    var v_from_first: String?
    var passBlock:PassBlock!

    var delegate:passValueByProtocol!
    
    var dit:Dictionary = [String:Any]()
    var passdicblock: PassDicBlock!
    
    var arr:Array = [String]()
    var passarrblock: passArrBlock!
    
    
    @IBOutlet var tf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 从第一个页面传过来的值
        self.tf.text = v_from_first
    }

    @IBAction func back(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
//        if (self.passBlock != nil) {
//            // 反向传值
//            self.passBlock!(tf.text!)
//        }
//        
        if (delegate != nil) {
            delegate.passValueByPro(str: tf.text!)
        }
        
        // 传递字典值
        dit["aaa"] = "vaaa"
        dit["bbb"] = "vbbb"

        if self.passdicblock != nil {
            self.passdicblock(dit)
        }
        
        // 传递数组
        arr.append("ddddddd")
        arr.append("eeeeeee")
        arr.append("fffffff")
        
        if self.passarrblock != nil {
            self.passarrblock(arr)
        }
    

}
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

protocol passValueByProtocol {
    func passValueByPro(str:String) -> Void
}
