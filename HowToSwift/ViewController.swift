//
//  ViewController.swift
//  HowToSwift
//
//  Created by R on 2014/08/23.
//  Copyright (c) 2014年 マック太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate{

    //変数
    var array:[String] = []
    
    //IB接続
    @IBOutlet weak var label: UILabel!
    
    //IB接続アクション
    @IBAction func Btn(sender: UIButton) {
        
        //画面遷移
        //この辺は今まで通りのノリで
        //IBでSegueの箇所がちょっと変わっていた
        //今まであったpsuh,modalとかが非推奨になってた
        //なんか新しいのになってた
        //とりあえず分かんないので適当に指定
        self.performSegueWithIdentifier("SecondView", sender: self)
    }
    //overrideしないと怒られる
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        //文字列比較は「==」で良いっぽい
        //Stringはどうやらオブジェクト型ではないようだ
        if (segue.identifier == "SecondView") {
            array.append("サル")
            array.append("ゴリラ")
            array.append("チンパンジー")
            
            //キャストするときはas使うと良いみたい
            //destinationViewControllerの戻り値は「AnyObject」になっていた
            //objective-cでいう「id」ってことにしとこう
            //ってかSecondViewControllerインポートしなくてもいいのか？
            var vc = segue.destinationViewController as SecondViewController
            vc.delegate = self
            vc.hoge = array[1]
            
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //変数名は全角でもOKっぽい
        //絵文字もいけるって聞いたけどなんかダメだった
        //文字列には「@」は不要
        var 金 = "命より重い!"
        
        //コンソールに出力したい場合はこう「%@」とかいらん
        println(金)
        
        //今まで通りNSLogも使えるYO
        NSLog("%@", 金)
        
        //NSLogではコンソールには日付とかが一緒に出力されるけど
        //printlnは出ない
        
        //関数呼び出し
        //selfをつけてもつけなくても大丈夫
        createLabel(金)
        
        //letは値変更できませんよ宣言
        //Objective-cだとconstやプロパティのreadOnly属性的位置づけどと勝手に思う今日この頃
        let a = 1
        //こんなんことをすると怒られます
//        a = 2
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //関数定義引数無いバージョン
    //外部に公開したくないメソッドはpriveteつけるといい
    private func createLabel(str:String) {
        
        label.text = str
        
        //初期化メソッドで色指定はこんな感じ
        //ってか10.0fって書き方すると怒られるんだけどなんで？
        label.backgroundColor = UIColor(red:10.0, green:10.0, blue:10.0, alpha:1.0)
        
        //クラスメソッドの場合はこんな感じでかける
        label.backgroundColor = UIColor.greenColor()
        
    }
    
    //デリゲート
    func hogehoge(str:String) {
        label.text = str
    }

}

