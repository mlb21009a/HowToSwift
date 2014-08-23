//
//  SecondViewController.swift
//  HowToSwift
//
//  Created by R on 2014/08/23.
//  Copyright (c) 2014年 マック太郎. All rights reserved.
//

//新規でswiftファイルを作成したら「import Foundation」しかなかった
//ってかobjective-cみたくどのクラス継承するの？ってやつが出なかった
//いちいち自分で書く必要があるのかそれともなんか設定でできんのかは不明
//ただこのままだといちいちメンドいので激おこプンプン丸にならざるを得ない
import Foundation

import UIKit

//プロトコル
@objc protocol SecondViewControllerDelegate {
   func hogehoge(str:String)
}

class SecondViewController: UIViewController {
    
    //変数
    //一応プロパティ的な位置づけで使っている
    //「!」つけないと何かエラーになる
    //値入れてないからnilになってんで怒られると思う
    var hoge:String!
    
    weak var delegate:SecondViewControllerDelegate!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func tapBtn(sender: UIButton) {
        
        self.delegate.hogehoge(hoge)
        
        //戻る時もいままでと同じノリでいける
        // YESではなくtrueになった
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.redColor()
        
        label.text = hoge
    }

}

