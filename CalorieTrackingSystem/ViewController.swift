//
//  ViewController.swift
//  stepCounter
//
//  Created by SERHAT YILDIRIM on 28/12/2016.
//  Copyright © 2016 SERHAT YILDIRIM. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {
    
    /*@IBOutlet weak var lblSteps: UILabel!
     @IBOutlet weak var lblActicity: UILabel!
     @IBOutlet weak var stateImageView: UIImageView!
     */
    
    @IBOutlet weak var lblActicity: UILabel!
    @IBOutlet weak var lblSteps: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var imageview2: UIImageView!
    var calendar = Calendar.current
    var date = Date()
    var last_modified2:String = ""
    var totalStep:Array<Int> = []
    var stepnumber : Int = 0
    var days : [String] = []
    var stepsTaken:[Int]=[]
    
    let activityManager = CMMotionActivityManager()
    let pedoMeter = CMPedometer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
       /*let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "totalStep")
        defaults.synchronize()
        defaults.removeObject(forKey: "lastModified2")
        defaults.synchronize()
        
        totalStep.append(4529)
        totalStep.append(7280)
        totalStep.append(5543)
        totalStep.append(7037)
        let defaultsdate = UserDefaults.standard
        defaultsdate.removeObject(forKey: "totalStep")
        defaultsdate.synchronize()
        UserDefaults.standard.set(totalStep, forKey: "totalStep")
        UserDefaults.standard.set("2017/01/19", forKey: "lastModified2")*/
        
        
        if let savedDate = UserDefaults.standard.string(forKey: "lastModified2") {
            last_modified2 = savedDate
            
        }
        
        if let stepArray : AnyObject? = UserDefaults.standard.object(forKey: "totalStep") as AnyObject?? {
            totalStep = stepArray  as! Array<Int>
            print(totalStep)
            //selectedArray : [String] = testArray! as! [String]
        }
        
        self.imageview2.image = UIImage(named: "step")
        
        var date = Date()
        var cal = Calendar.current
        //var asd = cal.dateComponents(.NSYearCalendarUnit | .NSMonthCalendarUnit | .NSDayCalendarUnit | .NSHourCalendarUnit | .NSMinuteCalendarUnit | .NSSecondCalendarUnit , from: NSDate())
        
        
        //var comps = cal.components(.NSYearCalendarUnit | .NSMonthCalendarUnit | .NSDayCalendarUnit | .NSHourCalendarUnit | .NSMinuteCalendarUnit | .NSSecondCalendarUnit , fromDate: NSDate())
        
        var comps = cal.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        
        
        //var comps = cal.components(NSCalendarUnit.YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit | .HourCalendarUnit | .MinuteCalendarUnit | .SecondCalendarUnit, fromDate: NSDate())
        comps.hour = 0
        comps.minute = 0
        comps.second = 0
        //let timeZone = NSTimeZone.systemTimeZone()
        let timeZone = NSTimeZone.system
        cal.timeZone = timeZone
        
        //let midnightOfToday = cal.dateFromComponents(comps)!
        let midnightOfToday = cal.date(from: comps)!
        
        /*
         if(CMMotionActivityManager.isActivityAvailable()){
         self.activityManager.startActivityUpdates(to: OperationQueue { (data: CMMotionActivityHandler) -> Void in
         DispatchQueue.main.async(execute: { () -> Void in
         if(data.stationary == true){
         self.lblActicity.text = "Stationary"
         self.stateImageView.image = UIImage(named: "Sitting")
         } else if (data.walking == true){
         self.lblActicity.text = "Walking"
         self.stateImageView.image = UIImage(named: "Walking")
         } else if (data.running == true){
         self.lblActicity.text = "Running"
         self.stateImageView.image = UIImage(named: "Running")
         } else if (data.automotive == true){
         self.lblActicity.text = "Automotive"
         }
         })
         
         })
         }
         */
        /*
         if(CMMotionActivityManager.isActivityAvailable()){
         print("YES!")
         self.activityManager.startActivityUpdates(to: OperationQueue) { data in
         if let data = data {
         dispatch_async(dispatch_get_main_queue()) {
         if(data.stationary == true){
         self.lblActicity.text = "Stationary"
         } else if (data.walking == true){
         self.lblActicity.text = "Walking"
         } else if (data.running == true){
         self.lblActicity.text = "Running"
         } else if (data.automotive == true){
         self.lblActicity.text = "Automotive"
         }
         }
         }
         }
         }
         */
        if(CMMotionActivityManager.isActivityAvailable()){
            print("YES!")
            self.activityManager.startActivityUpdates(to: OperationQueue.main) { data in
                if let data = data {
                    DispatchQueue.main.async(execute: { () -> Void in
                        if(data.stationary == true){
                            self.lblActicity.text = "Stationary"
                            self.imageview.image = UIImage(named: "stand")
                        } else if (data.walking == true){
                            self.lblActicity.text = "Walking"
                            self.imageview.image = UIImage(named: "walk")
                        } else if (data.running == true){
                            self.lblActicity.text = "Running"
                            self.imageview.image = UIImage(named: "run")
                        } else if (data.automotive == true){
                            self.lblActicity.text = "Automotive"
                            self.imageview.image = UIImage(named: "automative")
                        }
                    })
                }
            }
        }
        
        if(CMPedometer.isStepCountingAvailable()){
            let fromDate = NSDate(timeIntervalSinceNow: -86400 * 7)
            
            self.pedoMeter.queryPedometerData(from: fromDate as Date, to: date) { (data : CMPedometerData?, error) -> Void in
                DispatchQueue.main.async(execute: { () -> Void in
                    if(error == nil){
                        print("\(data!.numberOfSteps)")
                        self.stepnumber = Int(data!.numberOfSteps)
                        self.saveStep()
                        //self.lblActicity.text = "\(data!.numberOfSteps)"
                    }
                })
            }
            
            self.pedoMeter.startUpdates(from: midnightOfToday) { (data: CMPedometerData?, error) -> Void in
                DispatchQueue.main.async(execute: { () -> Void in
                    if(error == nil){
                        print("\(data!.numberOfSteps)")
                        self.lblSteps.text = "\(data!.numberOfSteps)"
                        self.stepnumber = Int(data!.numberOfSteps)
                        self.saveStep()
                    }
                })
            }
        }
        
        
        
        
        
    }
    
    
    func saveStep(){
        
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let year : Int = components.year!
        let month : Int = components.month!
        let day : Int = components.day!
        
        
        var str = String(year)
        str += "/"
        str += String(month)
        str += "/"
        str += String(day)
        
        /* totalStep.append(4529)
         totalStep.append(7280)
         totalStep.append(5543)
         totalStep.append(7037)*/
        
        
        /*if(lblSteps.text != ""){
         stepnumber = Int(lblSteps.text!)!
         }
         else{
         stepnumber = 0
         }*/
        
        if(last_modified2 != str){
            
            //userdefault a ekle
            if(totalStep.count<7){
                totalStep.append(stepnumber)
            }
            else{
                totalStep.removeFirst()
                totalStep.append(stepnumber)
            }
            let defaultsdate = UserDefaults.standard
            defaultsdate.removeObject(forKey: "totalStep")
            defaultsdate.synchronize()
            UserDefaults.standard.set(totalStep, forKey: "totalStep")
            UserDefaults.standard.set(str, forKey: "lastModified2")
            
        }
        else{
            totalStep.removeLast()
            totalStep.append(stepnumber)
            let defaultsdate = UserDefaults.standard
            defaultsdate.removeObject(forKey: "totalStep")
            defaultsdate.synchronize()
            UserDefaults.standard.set(totalStep, forKey: "totalStep")
            UserDefaults.standard.set(str, forKey: "lastModified2")
            
        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

