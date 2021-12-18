//
//  ViewController.swift
//  MigrosApp
//
//  Created by Furkan Kara on 15.12.2021.
//

import UIKit

class ViewController: UIViewController{
 
   
    @IBOutlet weak var sanalMarket: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
//       searchBar cell i register ettim
        let nibSearchBar = UINib(nibName: "searchBarCell", bundle: nil)
        tableView.register(nibSearchBar, forCellReuseIdentifier: "searchBarCell")
        
        let nibHeaderLabel = UINib(nibName: "HeaderLabelTableViewCell", bundle: nil)
        tableView.register(nibHeaderLabel, forCellReuseIdentifier: "headerLabelCell")
        
        let nibCollectionView = UINib(nibName: "CollectionViewCell", bundle: nil)
        tableView.register(nibCollectionView, forCellReuseIdentifier: "CollectionViewCell")
       
        let nibButton = UINib(nibName: "ButtonCell", bundle: nil)
        tableView.register(nibButton, forCellReuseIdentifier: "ButtonCell")
        
        let nibImageSlider = UINib(nibName: "ImageSliderCell", bundle: nil)
        tableView.register(nibImageSlider, forCellReuseIdentifier: "ImageSliderCell")

        
        
       
       
        
       
        
       
        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func sanalMarket(_ sender: Any) {
     
        
    
    }
    
}





// Table view için gerekli fonksiyonlar
extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 17
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellSearchBar  = tableView.dequeueReusableCell(withIdentifier: "searchBarCell") as! searchBarCell
        
        let cellSlider   = tableView.dequeueReusableCell(withIdentifier: "ImageSliderCell") as! ImageSliderCell
        
        let cellHeader   = tableView.dequeueReusableCell(withIdentifier: "headerLabelCell") as! HeaderLabelTableViewCell
        
        let cellProduct   = tableView.dequeueReusableCell(withIdentifier: "CollectionViewCell") as! CollectionViewCell
        
        let cellButton  = tableView.dequeueReusableCell(withIdentifier: "ButtonCell") as! ButtonCell
       
    if(indexPath.row == 0 ){
            
            return cellSearchBar
     
    }else if (indexPath.row == 1){
        return cellSlider
    }
        else{
            if(indexPath.row % 3 == 2){
                return cellHeader
            }else if(indexPath.row % 3 == 0) {
                return cellProduct
            }
            else {
                return cellButton
            }
        }
            
        
        

    }
   
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
      
        if(indexPath.row == 1 ){
            return 250
        }
        else if(indexPath.row % 3 == 0 && indexPath.row > 0){
            return 350
        }

        return 50
    }

    
    
    
}
