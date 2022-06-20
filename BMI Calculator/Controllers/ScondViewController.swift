//
//  ScondViewController.swift
//  BMI Calculator
//
//  Created by output. on 2020/06/18.
//  Copyright © 2020 Angela Yu. All rights reserved.
//
import UIKit

//classを定義
class SecondViewController: UIViewController {
    
    //labelに表示する変数
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //viewの背景を赤に
        view.backgroundColor = .red
        
        //UILabelを初期化
        let label = UILabel()
        //labelのtextにbmiValueを代入
        label.text = bmiValue
        //labelの位置とサイズをコードで作る
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        //labelを表示
        view.addSubview(label)
    }
    
}
