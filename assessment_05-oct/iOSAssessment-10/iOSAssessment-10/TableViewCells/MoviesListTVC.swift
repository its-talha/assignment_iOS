//
//  MoviesListTVC.swift
//  iOSAssessment-10
//
//  Created by Mohammad Talha on 11/10/21.
//

import UIKit

class MoviesListTVC: UITableViewCell {
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var moviesImages: UITableView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpCollectionView()
        
    }
    
    private func setUpCollectionView(){
        
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
        let nib = UINib.init(nibName: "MoviesCollectionViewCell", bundle: nil)
        moviesCollectionView.register(nib, forCellWithReuseIdentifier: "MoviesCollectionViewCell")
    }
    
}

extension MoviesListTVC: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as? MoviesCollectionViewCell
        cell?.layer.borderWidth = 5
        cell?.layer.borderColor = CGColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        return cell!
        
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 150.0, height: 150.0)
//    }
}
