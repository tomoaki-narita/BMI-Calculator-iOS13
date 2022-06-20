//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by output. on 2020/06/19.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //この変数にResultsViewController.swiftからbmiValueの値が渡ってくる
    var bmiValue: String?
    
    var advice: String?
    
    var color: UIColor?

    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var AdviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ResultsViewController.swiftから渡ってきた値を表示
        bmiLabel.text = bmiValue
        AdviceLabel.text = advice
        view.backgroundColor = color

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        //前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    

}
