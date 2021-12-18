//
//  ImageSliderCell.swift
//  MigrosApp
//
//  Created by Furkan Kara on 17.12.2021.
//

import UIKit

class ImageSliderCell: UITableViewCell {


    
    let data  = ["6","7","8","9","10"]
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        pageControl.numberOfPages = data.count
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
       
        let collectionCellNib = UINib(nibName: "SliderCollectionViewCell", bundle: nil)
        collectionView.register(collectionCellNib, forCellWithReuseIdentifier: "SliderCollectionViewCell")
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in collectionView.visibleCells {
                let indexPath = collectionView.indexPath(for: cell)
            pageControl.currentPage = indexPath!.row
            }
    }

    
    }
    

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
