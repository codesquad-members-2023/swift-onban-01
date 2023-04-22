//
//  ViewController.swift
//  Onban
//
//  Created by apple on 2023/04/19.
//

import UIKit

class ViewController: UIViewController {

    private var headerMessage = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeHeaderMessage()
    }
    
    func makeHeaderMessage() {
        let main = "온 가족이 좋아하는 든든한 메인 요리"
        let soup = "정성과 건강이 가득 담긴 국물 요리"
        let side = "식탁을 풍성하게 하는 정갈한 밑반찬"
        
        headerMessage.append(main)
        headerMessage.append(soup)
        headerMessage.append(side)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! HeaderCollectionReusableView
        
        header.headerLabel.text = headerMessage[indexPath.section]
        return header
    }
}

