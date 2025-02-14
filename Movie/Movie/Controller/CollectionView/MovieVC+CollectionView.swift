//
//  MovieVC+CollectionView.swift
//  Movie
//
//  Created by Asma on 28/11/2021.
//

import UIKit

//MARK: - Collection View for Animation


extension MovieVC:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - The start timer function of moving from one image to another in the collection view
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextIndex) , userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextIndex(){
        if currentCellIndex < arrayMovie.count - 1 {
            currentCellIndex += 1
        } else {
            currentCellIndex = 0
        }
        movieCollection.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayMovie.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        movieCell.imageMovie.image = arrayMovie[indexPath.row]
        return movieCell
        
    }
    
    //MARK: - size for CollectionView
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }
    
    
    //MARK: -
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
