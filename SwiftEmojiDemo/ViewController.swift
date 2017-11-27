//
//  ViewController.swift
//  SwiftEmojiDemo
//
//  Created by 高鑫 on 2017/11/27.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var arrayOne: [Int] = []
    var arrayTwo: [Int] = []
    var arrayThree: [Int] = []
    let emojiArray = ["🐶","🐱","🐭","🐰","🐼","🐷","🐵","🦄","🐔","🐮"]
    
    @IBOutlet weak var emojiPickerView: UIPickerView!
    @IBOutlet weak var goBtn: UIButton!
    @IBAction func goBtnAction(_ sender: UIButton) {
        goAction()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiPickerView.delegate = self
        emojiPickerView.dataSource = self
        emojiPickerView.isUserInteractionEnabled = false
        
        for _ in 0..<100 {
            arrayOne.append(Int(arc4random() % 10))
            arrayTwo.append(Int(arc4random() % 10))
            arrayThree.append(Int(arc4random() % 10))
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func goAction() {
        self.emojiPickerView.selectRow(Int(arrayOne[Int(arc4random() % 100)]), inComponent: 0, animated: true)
        self.emojiPickerView.selectRow(Int(arrayTwo[Int(arc4random() % 100)]), inComponent: 1, animated: true)
        self.emojiPickerView.selectRow(Int(arrayThree[Int(arc4random() % 100)]), inComponent: 2, animated: true)
    
        if arrayOne[self.emojiPickerView.selectedRow(inComponent: 0)] == arrayTwo[self.emojiPickerView.selectedRow(inComponent: 1)] && arrayTwo[self.emojiPickerView.selectedRow(inComponent: 1)] == arrayThree[self.emojiPickerView.selectedRow(inComponent: 2)] {
            UIView.animate(withDuration: 0.2, animations: {
                self.goBtn.backgroundColor = UIColor(named: "colorGreen")
            })
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.goBtn.backgroundColor = UIColor.white
            })
        }
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 70)
        pickerLabel.textAlignment = .center
        switch component {
        case 0:
            pickerLabel.text = emojiArray[Int(arrayOne[row])]
        case 1:
            pickerLabel.text = emojiArray[Int(arrayTwo[row])]
        case 2:
            pickerLabel.text = emojiArray[Int(arrayThree[row])]
        default:
            break
        }
        return pickerLabel
    }
    
}

