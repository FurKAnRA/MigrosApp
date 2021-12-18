//
//  ViewController.swift
//  MigrosApp
//
//  Created by Furkan Kara on 15.12.2021.
//

import UIKit

class ViewController: UIViewController{
    
    var product = [Product()]
    var cellHeaderArray = ["Tüm Ürünleri Gör","Yeni Yıl Heyecanı","İyi Et,Güvenilir Et Migros'ta!","Kış Akşamlarının Vazgeçilmezi","Migros Sanal Market'e Özel Ürünler"]
 
   
    @IBOutlet weak var sanalMarket: UIButton!
    
    @IBOutlet weak var migrosHemen: UIButton!
    
    
    @IBOutlet weak var migrosEkstra: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var cellHeaderTemp = 0
    var searchBar = searchBarCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        Denemek için birkaç ürün ekledim.
        product.append(Product(image: "urun1", productName: "Yılbaşı Kutusu", productPrice: "154,90"))
        product.append(Product(image: "urun2", productName: "Eğlence Paketi", productPrice: "99,90"))
        product.append(Product(image: "urun3", productName: "Sıcak Çikolata", productPrice: "1,70"))
        product.append(Product(image: "urun4", productName: "Çözülebilir Kahve", productPrice: "22,45"))
        product.append(Product(image: "urun5", productName: "Pirzola KG", productPrice: "141,90"))
 
//        Tableview a oluşturduğum hücreleri register etme işlemini  yapıyorum
        register()
        
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    
    

    
    func register (){
        let nibSearchBar = UINib(nibName: "searchBarCell", bundle: nil)
        self.tableView.register(nibSearchBar, forCellReuseIdentifier: "searchBarCell")
        
        let nibHeaderLabel = UINib(nibName: "HeaderLabelTableViewCell", bundle: nil)
        self.tableView.register(nibHeaderLabel, forCellReuseIdentifier: "headerLabelCell")
        
        let nibCollectionView = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.tableView.register(nibCollectionView, forCellReuseIdentifier: "CollectionViewCell")
       
        let nibButton = UINib(nibName: "ButtonCell", bundle: nil)
        self.tableView.register(nibButton, forCellReuseIdentifier: "ButtonCell")
        
        let nibImageSlider = UINib(nibName: "ImageSliderCell", bundle: nil)
        self.tableView.register(nibImageSlider, forCellReuseIdentifier: "ImageSliderCell")
    }
    
    
    @IBAction func sanalMarket(_ sender: Any) {
        
        sanalMarket.frame = CGRect(x:8, y: 62, width: sanalMarket.frame.width, height: sanalMarket.frame.height)
        migrosHemen.frame = CGRect(x:108, y: 46, width: sanalMarket.frame.width, height: sanalMarket.frame.height)
        migrosEkstra.frame = CGRect(x:208, y: 46, width: sanalMarket.frame.width, height: sanalMarket.frame.height)
    }
    
    
    @IBAction func migrosHemen(_ sender: Any) {
        sanalMarket.frame = CGRect(x:8, y: 46, width: sanalMarket.frame.width, height: sanalMarket.frame.height)
        migrosHemen.frame = CGRect(x:108, y: 62, width: sanalMarket.frame.width, height: sanalMarket.frame.height)
        migrosEkstra.frame = CGRect(x:208, y: 46, width: sanalMarket.frame.width, height: sanalMarket.frame.height)
    }
    
    
    @IBAction func migrosEkstra(_ sender: Any) {
        sanalMarket.frame = CGRect(x:8, y: 46, width: sanalMarket.frame.width, height: sanalMarket.frame.height)
        migrosHemen.frame = CGRect(x:108, y: 46, width: sanalMarket.frame.width, height: sanalMarket.frame.height)
        migrosEkstra.frame = CGRect(x:208, y: 62, width: sanalMarket.frame.width, height: sanalMarket.frame.height)
    }
    
    
    
    
    }

    






// Table view için gerekli fonksiyonlar
extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//         17 yi uygulamada o şekilde olduğu için kullandım
        return 17
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//          Bana kalsaydı ben header,ürünler için collectionview ve buton u tek bir hücre içinde yapıp verileri
//          o dosya içine gönderip orda işleyip kullanırdım.Fakat ödevde her biri için ayrı cell istendiği için
//          bu şekilde yaptım.Resimleri,fiyatları,başlıkları bir ödev olduğu için çok fazla veri olmadan rastgele
//          şekilde kullandım.Eğer veriler bir API den çekilseydi gerekli network altyapısını hazırlayıp verileri
//          hücre için yazdığım sınıflara göndercektim.
        
        
        let cellSearchBar  = tableView.dequeueReusableCell(withIdentifier: "searchBarCell") as! searchBarCell
        
        let cellSlider   = tableView.dequeueReusableCell(withIdentifier: "ImageSliderCell") as! ImageSliderCell
        
        let cellHeader   = tableView.dequeueReusableCell(withIdentifier: "headerLabelCell") as! HeaderLabelTableViewCell
        
        let cellProduct   = tableView.dequeueReusableCell(withIdentifier: "CollectionViewCell") as! CollectionViewCell
        
        let cellButton  = tableView.dequeueReusableCell(withIdentifier: "ButtonCell") as! ButtonCell

        
        //    arama ve slider ı belirli hücreler koydum
    if(indexPath.row == 0 ){
            
            return cellSearchBar
     
    }
    else if (indexPath.row == 1){
       
        return cellSlider
    }
//    Her cell in tableview içinde yerleşeceği yeri sıralı bir şekilde ayarlıyorum.Kendi uygulamasının aynısını olmasını
//    istediğim için
    else{
            if(indexPath.row % 3 == 2){
              
                cellHeader.headerLabel.text = cellHeaderArray[indexPath.row / 3]
                
                return cellHeader
                
            }
            else if(indexPath.row % 3 == 0) {
              
                cellProduct.configure(product: product[(indexPath.row/3) ])
                
               
               
                return cellProduct
            
            }
            else {
                
                return cellButton
                
            }
        }
            
        
        

    }
   
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    Ürün ve slider hücreleri için farklı bir yükseklik verdim
      
        if(indexPath.row == 1 ){
            return 250
        }
        else if(indexPath.row % 3 == 0 && indexPath.row > 0){
            return 350
        }

        return 50
    }

    
    
    
}


