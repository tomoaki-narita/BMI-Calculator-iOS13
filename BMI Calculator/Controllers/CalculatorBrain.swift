//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by output. on 2020/06/21.
//  Copyright © 2020 Angela Yu. All rights reserved.
//
//UIKitに書き換える(UIColorを使う為)
import UIKit
//bmiの計算をする構造体を作る
struct CalculatorBrain {
    
    //変数名bmiをFloat型にしてオプショナルにしておく
    //ユーザーがスライダーを動かして計算するまではbmi変数に値を入れておくのは意味がないので
    //計算されるまではnil(空)の状態にしておきたいのでオプショナル型で宣言
    var bmi: BMI?
    
    //bmiがnilに等しくない場合(空じゃなかったら)
    func getBMIValue() -> String {
        
        //        if bmi != nil {
        //            //bmiToDecimalPlaceにアンラップしたbmiを小数点第1位にフォーマットして代入
        //            let bmiToDecimalPlace = String(format: "%.1f", bmi!)
        //            return bmiToDecimalPlace
        //        //空だったら
        //        } else {
        //            //"0.0"を返す
        //             return "0.0"
        //        }
        
        //簡略化の書き方(nil合体演算子)。if else文を書かなくても良い
        //??とは、左辺がnillじゃなかったら左辺を使う。または、左辺がnillだったら右辺を使うという演算子
        //この場合は左辺のbmi?.valueに値が入ってなかったら右辺の0.0を入れるという処理
        //計算したbmiの値を小数点第1位にフォーマット("%.1f")
        let bmiToDecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToDecimalPlace
    }
    //getAdviceメソッド。bmi.adviceに値が入っていたらその値を、nilだったら"No advice"を使う処理
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    //getColorメソッド。bmi.colorに値が入っていたらその値を、nilだったらwhiteを使う処理
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    //構造体のプロパティは不変である為funcの前にmutatingをつける。bmiの計算をするメソッド
    mutating func calculatorBMI(heigt: Float, weight: Float) {
        //計算した値をbmiValue(定数)に入れる
        let bmiValue = weight / (heigt * heigt)
        
        //もし計算した値(bmiValue)が18.5未満だったら
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "under weight. Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        //そうでなくもし24.9未満だったら
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "nomal weight. Fit as a fiddle!", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        //それ以外だったら
        } else {
            bmi = BMI(value: bmiValue, advice: "over weight. Eat less pies!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
        //BMI(構造体)のvalueにbmiValueを入れる
        //bmi = BMI(value: bmiValue, advice: <#T##String#>, color: <#T##UIColor#>)
    }
}
