//
//  ViewController.swift
//  SampleDataStorage
//
//  Created by mzgk on 2016/12/09.
//  Copyright © 2016年 mzgk. All rights reserved.
//

/***
 独自クラスでUserDefaultsを利用するサンプル
 viewDidLoad()で保存し、読み出し、コンソールに内容を表示させる
***/

/***
 独自クラスをUserDefaultsに保存する場合は、一旦シリアライズしてUserDefaultsがサポートするData型に変換してから保存する。
 読み込み時は、デシリアライズしてData型 -> 独自データ型に変換して使用する。
 シリアライズ・デシリアライズ処理は、独自クラスにNSCodingプロトコルのメソッドを実装する。
 実装したメソッドは、それぞれ以下を経由して呼びだされる。
 シリアライズ：NSKeyedArchiver.archivedData(withRootObject: 独自クラスインスタンス)
 デシリアライズ：NSKeyedUnarchiver.unarchiveObject(with: デシリアライズ対象のデータ as Data)
***/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let data = MyData()
        data.valueString = "swift"

        // シリアライズ（独自データ型をシリアライズしてData型に変換する）
        // 以下でMyDataクラスのencordeを呼び出し処理する
        let archiveData = NSKeyedArchiver.archivedData(withRootObject: data)

        // 保存
        let userDefaults = UserDefaults.standard
        userDefaults.set(archiveData, forKey: "data")
        userDefaults.synchronize()

        // 取り出し
        if let storedData = userDefaults.object(forKey: "data") as? Data {
            // デシリアライズ
            // MyDataクラスのinit?を呼び出し処理する
            if let unarchiveData = NSKeyedUnarchiver.unarchiveObject(with: storedData as Data) as? MyData {
                if let valueString = unarchiveData.valueString {
                    print("デシリアライズデータ：" + valueString)
                }
            }
        }
        
//        if let value = userDefaults.string(forKey: "text") {
//            textField.text = value
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func tapSaveButton(_ sender: UIButton) {
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(textField.text, forKey: "text")
//        userDefaults.synchronize()
    }
}

