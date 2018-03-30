//
//  DailyViewController.swift
//  shikarStepCounter
//
//  Created by SERHAT YILDIRIM on 05/01/2017.
//  Copyright © 2017 SERHAT YILDIRIM. All rights reserved.
//

import UIKit

class DailyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var  dailyarray:Array<String> = []
    var  indexpth:IndexPath = []
    var  pth:Int = 0
    var  calories:Array<Int> = []
    var calendar = Calendar.current
    var last_modified:String = ""
    var date = Date()
    var totalCal:Array<Int> = []
    var counter = 0
    @IBOutlet weak var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)

        /*let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "selectedArray")
        defaults.synchronize()

        defaults.removeObject(forKey: "selectedArray2")
        defaults.synchronize()
        defaults.removeObject(forKey: "lastModified")
        defaults.synchronize()
        defaults.removeObject(forKey: "totalCal")
        defaults.synchronize()
        
        /*totalCal.append(1755)
        totalCal.append(1568)
        totalCal.append(2140)
        UserDefaults.standard.set(totalCal, forKey: "totalCal")
        UserDefaults.standard.set("2017/01/19", forKey: "lastModified")*/
        totalCal.append(867)
        totalCal.append(690)
        totalCal.append(1125)
        totalCal.append(1084)
        //let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "totalCal")
        defaults.synchronize()
        UserDefaults.standard.set(totalCal, forKey: "totalCal")
        UserDefaults.standard.set("2017/01/19", forKey: "lastModified")*/
        
        if let savedDate = UserDefaults.standard.string(forKey: "lastModified") {
            last_modified = savedDate
        }
        
        if let testArray : AnyObject? = UserDefaults.standard.object(forKey: "selectedArray") as AnyObject?? {
            selectedArray = testArray as! Array<[String]>
            //selectedArray : [String] = testArray! as! [String]
        }
        if let testArray2 : AnyObject? = UserDefaults.standard.object(forKey: "selectedArray2") as AnyObject?? {
            selectedArray2 = testArray2 as! Array<[Int]>
            //selectedArray : [String] = testArray! as! [String]
        }
        
        if let calArray : AnyObject? = UserDefaults.standard.object(forKey: "totalCal") as AnyObject?? {
            totalCal = calArray  as! Array<Int>
            print(totalCal)
            //selectedArray : [String] = testArray! as! [String]
        }
        
        
        
        let count = 0
        for var i in 0..<selectedArray.count{
            for var j in 0..<selectedArray[i].count{
                if(selectedArray[i][j] != nil){
                    dailyarray.append(selectedArray[i][j])
                    calories.append(100)
                }
            }
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSave(_ sender: Any) {
        
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let year : Int = components.year!
        let month : Int = components.month!
        let day : Int = components.day!
        
        
        var str = String(year)
        str += "/"
        str += String(month)
        str += "/"
        str += String(day)
        
        //print(str)
        print(selectedArray2)
        for var i in 0..<selectedArray.count{
            for var j in 0..<selectedArray[i].count{
                for var m in 0..<dailyarray.count{
                    if(selectedArray[i][j] == dailyarray[m]){
                        selectedArray2[i][j] *= calories[m]/100
                        counter += selectedArray2[i][j]
                        break
                    }
                }
            }
            
        }
        print(selectedArray2)
        
        /* for var i in 0..<calories.count{
         
         counter += calories[i]
         
         }*/
        
        /*for var i in 0..<selectedArray2.count{
         for var j in 0..<selectedArray2[i].count{
         if(selectedArray[i][j] != nil){
         dailyarray.append(selectedArray[i][j])
         calories.append(100)
         }
         }
         
         }*/
        
        //print(last_modified)
        
        /*if(last_modified == ""){
         totalCal.append(counter)
         UserDefaults.standard.set(totalCal, forKey: "totalCal")
         UserDefaults.standard.set(str, forKey: "lastModified")
         
         print("ilk ekleme")
         }*/
       /*  totalCal.append(867)
         totalCal.append(690)
         totalCal.append(1125)
         totalCal.append(1084)*/
        
        
        if(last_modified != str){
            print("kontrolkontrol")
            //userdefault a ekle
            if(totalCal.count<7){
                totalCal.append(counter)
            }
            else{
                totalCal.removeFirst()
                totalCal.append(counter)
            }
            let defaultsdate = UserDefaults.standard
            defaultsdate.removeObject(forKey: "totalCal")
            defaultsdate.synchronize()
            UserDefaults.standard.set(totalCal, forKey: "totalCal")
            UserDefaults.standard.set(str, forKey: "lastModified")
            
        }
        else{
            totalCal.removeLast()
            print("ttt")
            print(totalCal)
            totalCal.append(counter)
            print(totalCal)
            let defaultsdate = UserDefaults.standard
            defaultsdate.removeObject(forKey: "totalCal")
            defaultsdate.synchronize()
            UserDefaults.standard.set(totalCal, forKey: "totalCal")
            UserDefaults.standard.set(str, forKey: "lastModified")
            
        }
        print(counter)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.backgroundImage.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        // self.view.isHidden = false
        self.backgroundImage.contentMode = .scaleAspectFit
        animateTable()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func animateTable(){
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        let tableviewHeight = tableView.bounds.size.height
        
        for cell in cells{
            cell.transform = CGAffineTransform(translationX: 0, y: tableviewHeight)
        }
        var delayCounter = 0
        for cell in cells{
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        print("array son hal  \(dailyarray)")
        return dailyarray.count
        
        
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let cell:DailyProductsCell = tableView.dequeueReusableCell(withIdentifier: "dailycell") as! DailyProductsCell
        cell.isEditing = true
        
        //cell.textLabel?.textColor = UIColor(white: 195/255, alpha: 1)
        //cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 18)
        //let cell = MyCustomClass(style: UITableViewCellStyle.default , reuseIdentifier : "cell")
        //if(listControl == true){
        //  cell.textLabel?.text = array[indexPath.row]
        //navTitle.title = "Newspapers"
        //}
        //else {
        
        
        cell.textLabel?.text = dailyarray[indexPath.row]
        
        //cell.dailytext.text = dailyarray[indexPath.row]     //eklendi
        
        cell.lbldaily.text = String(calories[indexPath.row])
        
        cell.plusButton.addTarget(self, action:#selector(DailyViewController.plusClicked(_:)), for: .touchUpInside)
        
        cell.plusButton.tag=indexPath.row
        
        
        cell.minusButton.addTarget(self, action:#selector(DailyViewController.minusClicked(_:)), for: .touchUpInside)
        
        cell.minusButton.tag=indexPath.row
        
        //cell.lbldaily.text = String(calories[indexPath.row])
        
        
        indexpth = indexPath
        //pth = indexPath.row
        //print(pth)
        // cell.lbldaily.delegate = true
        /*let article = tableView.dequeueReusableCell(withIdentifier: "dailycell", for: indexPath) as! DailyProductsCell
         article.lbldaily?.text = "something"*/
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath as IndexPath) as? DailyProductsCell) != nil {
            pth = indexPath.row
            print(pth)
        }
    }
    
    /*func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
     
     let indexPath = tableView.indexPathForSelectedRow //optional, to get from any UIButton for example
     
     let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
     
     print(currentCell.textLabel!.text)
     
     }*/
    
    func minusClicked(_ sender: UIButton){
        
        
        
        let value = sender.tag;
        //print(value)
        //let indexPath = tableView.indexPathForSelectedRow
        //let cell = tableView.dequeueReusableCell(withIdentifier: "dailycell", for: indexpth) as! DailyProductsCell
        
        
        //let cell:DailyProductsCell = tableView.dequeueReusableCell(withIdentifier: "dailycell") as! DailyProductsCell
        print(pth)
        //var gram = Int(cell.lbldaily.text!)
        
        if(calories[value] != 100){
            calories[value] -= 100
            
            //cell.lbldaily.text = String(gram!)
            //cell.lbldaily.text =  String(describing: gram)
            //let article = tableView.dequeueReusableCell(withIdentifier: "dailycell", for: indexpth) as! DailyProductsCell
            //article.lbldaily?.text =  String(gram!)
            //calories[pth] = gram!
            print(calories)
        }
        
        //tableView.reloadRows(at: [indexpth], with)
        
        /*let defaults = UserDefaults.standard
         defaults.removeObject(forKey: "selectedArray")
         defaults.synchronize()
         UserDefaults.standard.set(selectedArray, forKey: "selectedArray")*/
        
        /* cell.plusButton.addTarget(self, action:#selector(DailyViewController.plusClicked(_:)), for: .touchUpInside)
         
         cell.plusButton.tag=indexpth.row
         
         
         cell.minusButton.addTarget(self, action:#selector(DailyViewController.minusClicked(_:)), for: .touchUpInside)
         
         cell.minusButton.tag=indexpth.row*/
        
        
        tableView.reloadData()
        
        //return cell
        
    }
    
    func plusClicked(_ sender: UIButton) {
        
        let value = sender.tag;
        //print(value)
        //let indexPath = tableView.indexPathForSelectedRow
        //let cell = tableView.dequeueReusableCell(withIdentifier: "dailycell", for: indexpth) as! DailyProductsCell
        
        
        //let cell:DailyProductsCell = tableView.dequeueReusableCell(withIdentifier: "dailycell") as! DailyProductsCell
        //let a:Int? = firstText.text.toInt()
        //var gram:Int? = Int(cell.lbldaily.text!)
        print(pth)
        if(calories[value] != 1000){
            
            calories[value] += 100
            //print(gram!)
            //calories[pth] = gram!
            print(calories)
            // cell.lbldaily.text = String(gram!)
            
            //cell.isEditing = true
            //cell.lbldaily.text = String(gram!)
            //let article = tableView.dequeueReusableCell(withIdentifier: "dailycell", for: indexpth) as! DailyProductsCell
            //article.lbldaily?.text =  String(gram!)
            
            /* cell.isEditing = true
             
             DispatchQueue.main.async {
             
             cell.lbldaily.text =  "sdsf"
             }*/
            
            
            
        }
        
        //selectedArray[counter].removeAll()
        //  selectedArray[counter].append(selected)
        
        
        /* let defaults = UserDefaults.standard
         defaults.removeObject(forKey: "selectedArray")
         defaults.synchronize()
         UserDefaults.standard.set(selectedArray, forKey: "selectedArray")*/
        
        /*cell.plusButton.addTarget(self, action:#selector(DailyViewController.plusClicked(_:)), for: .touchUpInside)
         
         cell.plusButton.tag=indexpth.row
         
         
         cell.minusButton.addTarget(self, action:#selector(DailyViewController.minusClicked(_:)), for: .touchUpInside)
         
         cell.minusButton.tag=indexpth.row*/
        
        tableView.reloadData()
        
        //return cell
    }
    
}
