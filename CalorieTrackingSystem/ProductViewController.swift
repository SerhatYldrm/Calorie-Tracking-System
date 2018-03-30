//
//  ProductViewController.swift
//  shikarStepCounter
//
//  Created by SERHAT YILDIRIM on 03/01/2017.
//  Copyright © 2017 SERHAT YILDIRIM. All rights reserved.
//

import UIKit
var selectedArray = Array(repeating: Array(repeating: String(), count: 0), count: 8)
var selectedArray2 = Array(repeating: Array(repeating: Int(), count: 0), count: 8)

class ProductViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    var deniz = ["Midye","İstiridye","Karides","Somon Füme","Ton Balığı"]
    var yag = ["Tereyağ","Margarin","Sıvı Yağ"]
    var et = ["Biftek","Tavuk","Tavuk Göğsü","Kuzu","Kuzu Ciğeri","Salam","Sosis"]
    var tahil_ = ["1 Dilim Beyaz Ekmek","1 Dilim Kepekli Ekmek","1 Dilim Kızarmış Ekmek","1 Adet Kruasan","Bisküvi","Mercimek","Arpa","Bulgur","Kuskus","Mısır","Buğday","Susam","Makarna (kuru)","Makarna (haşlanmış)","Pirinç (kuru)","Pirinç (haşlanmış)"]
    var sut = ["Yoğurt (yağlı)","Süt","Yoğurt (yağlı,meyveli)","Beyaz Peynir","Kaşar Peyniri","Parmesan Peyniri","Yumurta","Yumurta Akı","Yumurta Sarısı"]
    var sebze = ["Domates","Enginar","Patlıcan","Taze Fasülye","Brokoli","Brüksel Lahanası","Kabak","Havuç","Karnabahar","Kereviz","Salatalık","Marul","Mantar","Soğan","Bezelye","Taze Yeşil Biber","Patates","Ispanak","Lahana"]
    var kuruyemis = ["Badem","Hindistan Cevizi","Fındık","Fıstık","Çam Fıstığı","Ceviz","Patlamış Mısır","Kabak Çekirdeği","Ay Çekirdeği"]
    var meyve = ["Elma","Kayısı","Muz","Kiraz","Hurma","İncir","Greyfurt","Portakal","Kivi","Mandalina","Karpuz","Kavun","Şeftali","Armut","Erik","Üzüm","Çilek"]
    var deniz2 = [9,6,144,171,121]
    var yag2 = [206,204,130]
    var et2 = [278,132,150,282,232,446,295]
    var tahil2_ = [90,60,35,200,470,314,367,371,367,342,364,589,339,85,357,125]
    var sut2 = [95,68,125,275,413,440,80,15,65]
    var sebze2 = [14,10,28,90,35,35,25,35,32,18,11,15,14,35,89,15,100,26,20]
    var kuruyemis2 = [600,603,650,560,600,549,478,571,578]
    var meyve2 = [60,8,100,40,15,41,59,60,50,34,50,19,18,60,70,8,57,26]
    
    var currentDate:String = ""
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    var numberArray:[String] = []//NSMutableArray()
    //var selectedArray:[[NSMutableArray]] = [[]]  //NSMutableArray()
    var selected = Array<String>() // = //NSMutableArray()
    var selected2 = Array<Int>()
    //var x = Array(count)
    var array:Array<String> = []
    var array2:Array<Int> = []
    //var categoryVC = CategoryyViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        /*let cell:MyCustomClass = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyCustomClass
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)*/
        //cell.backgroundColor = .clear
        //let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        //let blurView = UIVisualEffectView(effect: blurEffect)
        //blurView.frame = self.view.bounds
        //self.view.addSubview(blurView)
        /* let defaults = UserDefaults.standard
         defaults.removeObject(forKey: "selectedArray")
         defaults.synchronize()
         defaults.removeObject(forKey: "selectedArray2")
         defaults.synchronize()
         defaults.removeObject(forKey: "curDate")
         defaults.synchronize()*/
        
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        currentDate = formatter.string(from: date)
        
        if let savedDate = UserDefaults.standard.string(forKey: "curDate") {
            
            
            if(savedDate == currentDate){
                if let testArray : AnyObject? = UserDefaults.standard.object(forKey: "selectedArray") as AnyObject?? {
                    selectedArray = testArray as! Array<[String]>
                    //selectedArray : [String] = testArray! as! [String]
                }
                
                
                if let testArray2 : AnyObject? = UserDefaults.standard.object(forKey: "selectedArray2") as AnyObject?? {
                    selectedArray2 = testArray2 as! Array<[Int]>
                    //selectedArray : [String] = testArray! as! [String]
                }
            }
            
        }
        /*if let object = UserDefaults.standard.dictionary(forKey: "selectedArray") as? [[String]]  {
         selectedArray = object
         print(object)
         }*/
        /*if let object = UserDefaults.standard.array(forKey: "selectedArray") {
         selectedArray = [object as! [String]]
         }*/
        
        /* tableView.layer.masksToBounds = true
         tableView.layer.borderColor = UIColor( red: 153/255, green: 153/255, blue:0/255, alpha: 1.0 ).cgColor
         tableView.layer.borderWidth = 2.0
         
         let border = CALayer()
         let width = CGFloat(2.0)
         border.borderColor = UIColor.darkGray.cgColor
         border.frame = CGRect(x: 0, y: tableView.frame.size.height - width, width:  tableView.frame.size.width, height: tableView.frame.size.height)
         
         border.borderWidth = width
         tableView.layer.addSublayer(border)
         tableView.layer.masksToBounds = true*/
        
        //print("Kontrol ")
        print( counter)
        
        switch counter {
        case 0:
            array = deniz
            array2 = deniz2
        case 1:
            array = et
            array2 = et2
        case 2:
            array = kuruyemis
            array2 = kuruyemis2
        case 3:
            array = meyve
            array2 = meyve2
        case 4:
            array = sebze
            array2 = sebze2
        case 5:
            array = sut
            array2 = sut2
        case 6:
            array = tahil_
            array2 = tahil2_
        //print("asda" + array[2])
        case 7:
            array = yag
            array2 = yag2
        default: break
        }
        
        
        //array = categoryVC.array
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.imageView.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        // self.view.isHidden = false
        self.imageView.contentMode = .scaleAspectFit

        animateTable()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return array.count
        
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
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:MyCustomClass = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyCustomClass
        cell.textLabel?.textColor = UIColor(white: 0/255, alpha: 1)
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 18)
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
        //let cell = MyCustomClass(style: UITableViewCellStyle.default , reuseIdentifier : "cell")
        //if(listControl == true){
        //  cell.textLabel?.text = array[indexPath.row]
        //navTitle.title = "Newspapers"
        //}
        //else {
        cell.textLabel?.text = array[indexPath.row]+" (" + String(array2[indexPath.row]) + " cal)"
        // navTitle.title = "Favourites"
        //}
        cell.tickButton.addTarget(self, action:#selector(ProductViewController.tickClicked(_:)), for: .touchUpInside)
        
        cell.tickButton.tag=indexPath.row
        
        
        //cell.tickButton = UIButton(type: UIButtonType.custom)
        //cell.tickButton.buttonType = UIButtonType.custom
        
        
        if(selectedArray[counter].count>0){
            selected = selectedArray[counter]
            selected2 = selectedArray2[counter] //
            //selected.append(selectedArray[counter])
            //selected.add(selectedArray[counter])
        }
        
        if selected.contains(array[indexPath.row]) { //numberArray.object(at: indexPath.row)
            // cell.tickButton.setImage(UIImage(named: "Select")?.withRenderingMode(.alwaysOriginal), for: .normal)
            
            cell.tickButton.setBackgroundImage(UIImage(named:"Select"), for: UIControlState.normal)
            
        }
        else
        {
            //cell.tickButton.setImage(UIImage(named: "Diselect")?.withRenderingMode(.alwaysOriginal), for: .normal)
            cell.tickButton.setBackgroundImage(UIImage(named:"Diselect"), for: UIControlState.normal)
        }
        
        
        
        
        
        return cell
    }
    
    @IBAction func tickClicked(_ sender: UIButton) {
        
        let value = sender.tag;
        
        if selected.contains(array[value])//array.object(at: value)
        {
            print(value)
            print(selected.count)
            
            for var i in 0..<selected.count {
                if(selected[i] == array[value]){
                    selected.remove(at: i)
                    selected2.remove(at: i)
                    break
                    //selected.remove(at: )
                }
            }
            //selectedArray[counter].removeAll()
            selectedArray[counter] = selected
            selectedArray2[counter] = selected2
            //selected.remove(array[value])
        }
        else
        {
            //selectedArray[counter].append(array[value])
            //selected.add(array[value])
            selected.append(array[value])
            selectedArray[counter] = selected
            
            selected2.append(array2[value])
            selectedArray2[counter] = selected2
        }
        
        print("Seleceted Array \(selectedArray)")
        print("selected 2 \(selectedArray2)")
        //selectedArray[counter].removeAll()
        //  selectedArray[counter].append(selected)
        
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "selectedArray")
        defaults.synchronize()
        UserDefaults.standard.set(selectedArray, forKey: "selectedArray")
        
        
        let defaults2 = UserDefaults.standard
        defaults2.removeObject(forKey: "selectedArray2")
        defaults2.synchronize()
        UserDefaults.standard.set(selectedArray2, forKey: "selectedArray2")
        
        
        let defaultsdate = UserDefaults.standard
        defaultsdate.removeObject(forKey: "curDate")
        defaultsdate.synchronize()
        UserDefaults.standard.set(currentDate, forKey: "curDate")
        
        
        tableView.reloadData()
        
        
    }
    
     func tableView(tableView: UITableView, willDisplayCell cell: MyCustomClass, forRowAtIndexPath indexPath: IndexPath) {
       
        print("test")
        let cell:MyCustomClass = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyCustomClass
        //cell.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        self.view.addSubview(blurView)
    }
    
    
    
}
