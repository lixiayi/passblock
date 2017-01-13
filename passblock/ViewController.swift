//
//  ViewController.swift
//  passblock
//
//  Created by xiaoyi li on 17/1/13.
//  Copyright © 2017年 xiaoyi li. All rights reserved.
//

import UIKit

class ViewController: UIViewController,passValueByProtocol {
    @IBOutlet var lbl: UILabel!

    @IBAction func tanchu(_ sender: AnyObject) {
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? Second
        // 正向传值
        vc?.v_from_first = "lixiaoyi"
        
        // 通过block来接收
        vc?.passBlock = { (value: String) in
            self.lbl.text = value
        }
        
        vc?.passdicblock = { (dicValue:Dictionary) in
            print(dicValue)
            
        }
        vc?.passarrblock = { (arrValue:Array) in
            print(arrValue)
            
        }
        
        // 通过代理接收，需要继承协议：passValueByProtocol 并且 实现代理方法passValueByPro
        vc?.delegate = self
    }
    
    func passValueByPro(str: String) {
        self.lbl.text = str
    }


}

