//
//  ViewController.swift
//  Onban
//
//  Created by apple on 2023/04/19.
//

import UIKit
import Toaster
import OSLog

class ViewController: UIViewController {

    private var sectionNumber = 0
    private var headerMessage = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeHeaderMessage()
        fetchFood(of: "main")
    }
    
    func makeHeaderMessage() { // 데이터 객체 따로 타입 분리
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
        return headerMessage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    // 탭 제스처 따로 분리
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! HeaderCollectionReusableView
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        header.isUserInteractionEnabled = true
        header.addGestureRecognizer(tapGesture)
        header.headerLabel.text = headerMessage[indexPath.section]
        sectionNumber = indexPath.section
        return header
    }
    
    @objc func labelTapped() {
        Toast(text: "\(headerMessage[sectionNumber])").show()
    }
}

extension ViewController {
    func fetchFood(of foodType: String) {
        let urlList = [baseEndPoint, foodType]
        guard let url = URL(string: urlList.joined(separator: "/")) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in

            if let error = error {
                os_log("Error: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                os_log("invalid response")
                return
            }
            
            guard let data = data else {
                fatalError("invalid data")
            }
            
            guard let foodResponse = try? JSONDecoder().decode(FoodResponse.self, from: data) else {
                os_log("Response: \(error)")
                return
            }
        }
        dataTask.resume()
    }
}
