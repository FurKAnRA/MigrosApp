//
//  ImageSliderCell.swift
//  MigrosApp
//
//  Created by Furkan Kara on 17.12.2021.
//

import UIKit
import iCarousel



class ImageSliderCell: UITableViewCell {
    
    //     Third party eklenti kurdum normal collectionView ile yaptım fakat daha güzel gözükmesi için iCarousel kütüphanesini
    //    kullandım. Collectionview için kodları silmeyeceğim. Sadece yorum satırına alacağım

    @IBOutlet weak var selfView: UIView!
//     Migros uygulamasından aldığım resimlerin isimleri
    let data  = ["6","7","8","9","10"]

    
    let carousel : iCarousel  = {
        let view = iCarousel()
        view.type = .rotary
        
        
        return view
    }()

//    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        selfView.addSubview(carousel)
        
        carousel.delegate = self
        
        carousel.dataSource = self
//        carousel büyüklüğünü ayarladım
        carousel.frame = CGRect(x: 0, y: 0, width: selfView.frame.width , height: 215)
//        seçilen item merkezde olması gerkektiği için yazdım
        carousel.centerItemWhenSelected = true
//      sağa veya sola giderken sürekli gitmesin itemın durması gerektiği için yazdım.
        carousel.isPagingEnabled = true
        
        
        
     
        
        
        
//        page control da indicator image i değiştirebilirdim fakat system ıcon'larında orjinal
//        uygulamadaki gibi çizgi bulamadım. Kodunu aşağıya bırakıyorum.
//        pageControl.preferredIndicatorImage = UIImage(systemName: " icon name ")
        
        pageControl.numberOfPages = data.count
      
        
        
        
//        collectionView.delegate = self
//        collectionView.dataSource = self
        
//
//        let collectionCellNib = UINib(nibName: "SliderCollectionViewCell", bundle: nil)
//        collectionView.register(collectionCellNib, forCellWithReuseIdentifier: "SliderCollectionViewCell")
//
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    //     page control için yazdığım scroll fonskiyonu
    func carouselDidScroll(_ carousel: iCarousel) {
        pageControl.currentPage = carousel.currentItemIndex
    }
    



    
    }
    
//herhangi bir veri almadığım için örnek olsun diye yazdığım 5 değeri
extension ImageSliderCell : UICollectionViewDelegate,  UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as! SliderCollectionViewCell
        cell.imageView.image = UIImage(named: data[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: collectionView.frame.width, height: 215)
    }
    
   
   
    
   
}


extension ImageSliderCell : iCarouselDelegate,iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 5
    }
    
 
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: selfView.frame.width - 20 , height: 215))
        view.backgroundColor = .white
        
//         carousel e image eklemek için yapıldı
        let imageView = UIImageView(frame: view.bounds)
        
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "\(index + 6)")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        view.addSubview(imageView)
        
       
        
        
        
        return view
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        switch(option){
        case .wrap :
             do {
                 
                 return 0
        }
        
        default :
            do {
            return value
        }
          
        }
    }
    
    
}
