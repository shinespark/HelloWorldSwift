//
//  ViewController.swift
//  HelloWorld
//
//  Created by metroid on 2018/03/30.
//  Copyright © 2018 shinespark. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        myPickerView.delegate = self
        myPickerView.dataSource = self
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

    //
    @IBOutlet weak var myPickerView: UIPickerView!
    let compos = [["月", "火", "水", "木", "金"], ["早朝", "午前中", "昼間", "夜間"]]
    
    // ピッカービューのコンポーネントの個数を返す
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return compos.count
    }
    
    // 各コンポーネントの行数を返す
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let compo = compos[component]
        return compo.count
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            // 月〜金
            return 50
        } else {
            // 時間帯
            return 100
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = compos[component][row]
        return item
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = compos[component][row]
        print("\(item)が選ばれた")
        
        // 現在選択されている行番号
        let row1 = pickerView.selectedRow(inComponent: 0)
        let row2 = pickerView.selectedRow(inComponent: 1)
        print("現在選択されている行番号\(row1, row2)")
        
        // 現在選択されている項目名
        let item1 = self.pickerView(pickerView, titleForRow: row1, forComponent: 0)
        let item2 = self.pickerView(pickerView, titleForRow: row2, forComponent: 1)
        print("現在選択されている行番号\(item1!, item2!)")
        print("--------------------------------")
    }
}


