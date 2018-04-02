//
//  ViewController.swift
//  HelloWorld
//
//  Created by metroid on 2018/03/30.
//  Copyright © 2018 shinespark. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBAction func tapGreen(_ sender: Any) {
        view.backgroundColor = UIColor.green
    }
    
    @IBAction func tapWhite(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
    
    // Part 3 Chapter 12
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func hello(_ sender: Any) {
        myLabel.text = "こんにちは"
    }

    @IBAction func thankYou(_ sender: Any) {
        myLabel.text = "ありがとう"
    }
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // デリゲート宣言
        myTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // テキストフィールドが編集されると実行されるデリゲートメソッド
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let tapStr = textField.text! as NSString
        let replacedString = tapStr.replacingCharacters(in: range, with: string)
        
        if replacedString == "" {
            // 変更後が空ならラベルに 0 を入れる
            myLabel2.text = "0"
        } else {
            if let num = Int(replacedString) {
                myLabel2.text = String(num * 25)
            }
        }
        
        return true
    }
    
    // クリアボタンで実行されるデリゲートメソッド
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        myLabel2.text = "0"
        return true
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        // 編集終了でキーボードを下げる
        view.endEditing(true)
    }
}

