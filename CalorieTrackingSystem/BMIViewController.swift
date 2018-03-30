//
//  BMIViewController.swift
//  shikarStepCounter
//
//  Created by SERHAT YILDIRIM on 16/01/2017.
//  Copyright © 2017 SERHAT YILDIRIM. All rights reserved.
//

import UIKit
import Darwin

var height:Double = 0
var weight:Double = 0
var bsa:Double = 0
var fbw = 0
var iw = 0
var bmi:Double = 0


class BMIViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate{

    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var dropDown: UIPickerView!
    
    
    @IBAction func btnCalc(_ sender: Any) {
        
        
        if ((txtHeight.text?.isEmpty)! || (txtWeight.text?.isEmpty)!){
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen boyunuzu ve kilonuzu giriniz", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            height = Double(txtHeight.text!)!
            weight = Double(txtWeight.text!)!
        
        
        
       
        bsa = 0.007184 * pow(Double(weight),0.425 ) * pow(Double(height),0.725 )
         print(bsa)
        bsa = Double(Int(bsa * 1000) / 1000)
        
       // bsa = Int(Double(sqrt(Double(height * weight / 3600))))
        var temp:Double = Double(height/100) * Double(height/100)
        print(temp)
        bmi = Double(Double(weight) / temp)
        print(bmi)
        bmi = Double(Int(bmi * 1000) / 1000)
        iw = Int((Double(Int(0.3937 * Double(height)) - 60) * 2.3) + 50)
        }
        
        //iw = Int((Double(Int(0.3937 * Double(height)) - 60) * 2.3) + 45.5)
        //erkek (1.10 x Ağırlık (kg)) - 128 (Ağırlık2/(100 x Boy(m))2)
        //kadın (1.07 x Ağırlık (kg)) - 148 (Ağırlık2/(100 x Boy(m))2)
        
        //fbw = 100//(Int(1.10 * Double(weight / 100))) - 128 * ((weight * weight) / (100 * (height * height)))
    }
    
    var list = ["Kadın" , "Erkek"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        txtHeight.delegate = self
        txtWeight.delegate = self
        //self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard")))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    
   
    
    }
    
    func dismissKeyboard(){
        //txtHeight.resignFirstResponder()
        //txtWeight.resignFirstResponder()
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtHeight.resignFirstResponder()
        txtWeight.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
          //txtGender.text = list[row]
            //self.dropDown.isHidden = true
    }
    
    
    
    

}
