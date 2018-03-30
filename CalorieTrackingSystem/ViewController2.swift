//
//  ViewController2.swift
//  shikarStepCounter
//
//  Created by SERHAT YILDIRIM on 31/12/2016.
//  Copyright © 2016 SERHAT YILDIRIM. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var bki: NSLayoutConstraint!
    @IBOutlet weak var adim: NSLayoutConstraint!
    @IBOutlet weak var category: NSLayoutConstraint!
    @IBOutlet weak var graphic: NSLayoutConstraint!
    @IBOutlet weak var dailybesin: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)

        graphic.constant -= view.bounds.width
        dailybesin.constant -= view.bounds.width
        category.constant -= view.bounds.width
        adim.constant -= view.bounds.width
        bki.constant -= view.bounds.width
        // Do any additional setup after loading the view.
    }

    var animationPerform = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !animationPerform{
            UIView.animate(withDuration: 0.5, delay: 1.2, options: .curveEaseOut, animations: {
                self.graphic.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.bki.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
            UIView.animate(withDuration: 0.5, delay: 0.9, options: .curveEaseOut, animations: {
                self.dailybesin.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0.6, options: .curveEaseOut, animations: {
                self.category.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)

            
            UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
                self.adim.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            
            animationPerform = true
            
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
