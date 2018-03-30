//
//  BMICalcViewController.swift
//  shikarStepCounter
//
//  Created by SERHAT YILDIRIM on 16/01/2017.
//  Copyright © 2017 SERHAT YILDIRIM. All rights reserved.
//

import UIKit

class BMICalcViewController: UIViewController {

    //@IBOutlet weak var txtFbw: UITextField!


    @IBOutlet weak var lblBsa: UILabel!
    @IBOutlet weak var lblIw: UILabel!
    @IBOutlet weak var lblBmi: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var leftimage: UIImageView!
    @IBOutlet weak var rightimage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        lblBsa.text = String(bsa)
        lblBsa.sizeToFit()
        lblBmi.text = String(bmi)
        lblBmi.sizeToFit()
        //txtFbw.text = String(fbw)
        lblIw.text = String(iw)
        lblIw.sizeToFit()
        
        
        view1.backgroundColor = UIColor(red: 126/255.0, green: 208/255.0, blue: 98/255.0, alpha: 0.1)
        view2.backgroundColor = UIColor(red: 126/255.0, green: 208/255.0, blue: 98/255.0, alpha: 0.1)
        view3.backgroundColor = UIColor(red: 126/255.0, green: 208/255.0, blue: 98/255.0, alpha: 0.1)
        view4.backgroundColor = UIColor(red: 126/255.0, green: 208/255.0, blue: 98/255.0, alpha: 0.1)
        
        leftimage.image = UIImage(named: "sad")
        rightimage.image = UIImage(named: "sad")
        
        if(bmi > 0 && bmi <= 19){
            lblResult.text = "Zayıf"
            //view4.backgroundColor = UIColor(red: 205/255.0, green: 111/255.0, blue: 84/255.0, alpha: 0.4)
        }
        else if(bmi > 19 && bmi <= 25){
            lblResult.text = "Normal"
            leftimage.image = UIImage(named: "happy")
            rightimage.image = UIImage(named: "happy")
            //view4.backgroundColor = UIColor(red: 92/255.0, green: 223/255.0, blue: 109/255.0, alpha: 0.4)
        }
        else if(bmi > 25 && bmi <= 30){
            lblResult.text = "Fazla Kilolu"
            //view4.backgroundColor = UIColor(red: 126/255.0, green: 208/255.0, blue: 98/255.0, alpha: 0.4)
        }
        else if(bmi > 30 && bmi <= 35){
            lblResult.text = "Obez 1. Sınıf"
           // view4.backgroundColor = UIColor(red: 208/255.0, green: 221/255.0, blue: 70/255.0, alpha: 0.4)
        }
        else if(bmi > 35 && bmi <= 45){
            lblResult.text = "Obez 2. Sınıf"
            //view4.backgroundColor = UIColor(red: 208/255.0, green: 221/255.0, blue: 70/255.0, alpha: 0.4)
        }
        else if (bmi > 45){
            lblResult.text = "Aşırı Obez"
            //view4.backgroundColor = UIColor(red: 172/255.0, green: 34/255.0, blue: 61/255.0, alpha: 0.4)
        }
        lblResult.sizeToFit()
        //lblResult.center = CGPoint.
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
