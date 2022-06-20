//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalCulateViewController: UIViewController {
    
    //CalculatorBrain()を初期化
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //heightスライダー(小数点以下を2桁にしたいのでformatする)
    @IBAction func heightSliderChanged(_ sender: UISlider) {
         //フォーマットした値を変数に入れる
        let height = String(format: "%.2f", sender.value)
        //heightLabel.textにheight(変数)を表示
        heightLabel.text = "\(height)m"
        
    }
    
    //weightスライダー(小数点以下を0桁の整数にしたいのでformatする)
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        //フォーマットした値を変数に入れる
        let weight = String(format: "%.0f", sender.value)
        //weightLabel.textにweight(変数)を表示
        weightLabel.text = "\(weight)Kg"
    }
    
    //caluculateボタンを押した時の処理
    @IBAction func calculatePressed(_ sender: UIButton) {
        //定数にそれぞれのSliderのvalueを代入
        let height = heightSlider.value
        let weight = weightSlider.value
        
        //calculatorBMIのheightとweightの値を取得
        calculatorBrain.calculatorBMI(heigt: height, weight: weight)
        
        //bmiの計算式を定数に代入(2乗したいときはpowと書く)
        //weight(kg) / heght(m)6の2乗
//        let bmi = weight / pow(height, 2)//weight / (height * height)と同じ結果
//        bmiValue = String(format: "%.1f", bmi)
        
        //指定したidentifierのsegueを実行(画面遷移)
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    //segue実行時(画面遷移)にこのメソッド内のコードを実行(値渡し)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //もしsegueのidentifierが"goToResult"だったら
        if segue.identifier == "goToResult" {
            
            //segueの行先(destination as)はResultsViewControllerとして初期化
            let destinationVC = segue.destination as! ResultsViewController
            
            //destinationVC(ResultsViewController.swift)のbmiValueにcalculatorBrainのgetBMIValueのメソッドを渡す
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            
            //ResultsViewControllerのadviceにcalculatorBrainのgetAdviceメソッドを渡す
            destinationVC.advice = calculatorBrain.getAdvice()
            //ResultsViewControllerのcolorにcalculatorBrainのcolorメソッドを渡す
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

