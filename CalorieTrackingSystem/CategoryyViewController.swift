//
//  CategoryyViewController.swift
//  shikarStepCounter
//
//  Created by SERHAT YILDIRIM on 02/01/2017.
//  Copyright © 2017 SERHAT YILDIRIM. All rights reserved.
//

import UIKit
var counter:Int = 0
class CategoryyViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    var selectedindex = ""
    @IBOutlet weak var MyCollectionView: UICollectionView!
   // var array:Array<String> = []
    //var index:Int=2
    var images = ["deniz","et","kuruyemis","meyve","sebze","sut","tahil","yag"]
    
    var names = ["Deniz Ürünleri","Etler","Kuruyemişler","Meyveler","Sebzeler","Süt ve Yumurta Ürünleri","Tahıllar","Yağlar"]
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)

        
       
        // Do any additional setup after loading the view.
        
        //self.MyCollectionView.delegate = self
        //self.MyCollectionView.dataSource = self
    }

   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("denemee")
        // get a reference to the second view controller
        let secondViewController = segue.destination as! ProductViewController
        
        // set a variable in the second view controller with the String to pass
        secondViewController.array = kuruyemis
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_cell" , for: indexPath) as! MyCollectionViewCell
        
        cell.MyImageView.image = UIImage(named: images[indexPath.row])
        
        cell.labelname.text = names[indexPath.row]
        
        
        //let tapGesture = UITapGestureRecognizer(target: cell, action: #selector(imageTapped(gestureRecognizer:)),
      //  tapGesture.delegate = cell.self
        //tapGesture.numberOfTapsRequired = 1
        
        //cell.ima
        
        // add it to the image view;
        //cell.MyImageView.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
       // cell.MyImageView.isUserInteractionEnabled = true
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       counter = indexPath.row
       print(indexPath.row)
        
    
        //print(indexPath.row)
    }
    
   /* func imageTapped(gestureRecognizer: UIGestureRecognizer? = nil) {
        // if the tapped view is a UIImageView then set it to imageview
       /* var view = UIView!.self
        var loc = CGPoint!.self*/
        /*var loc = sender.location(in: sender.view)
        var selectedview = sender.view?.hitTest(loc , with: nil)?.tag*/
        var view = gestureRecognizer?.view
        var loc = gestureRecognizer?.location(in: view)        //view = gestureRecognizer
        
        var indexPath = (view?.hitTest(loc!, with: nil)?.tag)
        print()
        
        //if let imageView = sender.view as? UIImageView {
            print(names[indexPath!])
            print("Image Tapped")
            //Here you can initiate your new ViewController
            
       // }
    }*/
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
