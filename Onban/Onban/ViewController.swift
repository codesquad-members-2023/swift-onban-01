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
    private var sections = [[Food]]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFood(of: "main")
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FoodCollectionViewCell
        let food = sections[indexPath.section][indexPath.row]
        cell.title.text = food.title
        cell.desc.text = food.description
        
        if let normalPrice = food.normalPrice {
            cell.salePrice.text = food.salePrice
            
            cell.normalPrice.textColor = .gray
            let attributedString = NSMutableAttributedString(string: normalPrice)
            attributedString.addAttribute(
                .strikethroughStyle,
                value: NSUnderlineStyle.single.rawValue,
                range: NSRange(location: 0, length: attributedString.length)
            )
            cell.normalPrice.attributedText = attributedString
        } else {
            cell.normalPrice.isHidden = true
            cell.salePrice.text = food.salePrice
        }
        
        print(cell.badge.subviews.count)
        if let badge = food.badge, cell.badge.subviews.count == 0 {
            badge.enumerated().forEach { index, data in
                if data.contains("특가") {
                    let badgeLabel = BadgeLabel(index: 2, name: data)
                    cell.badge.addArrangedSubview(badgeLabel)
                } else {
                    let badgeLabel = BadgeLabel(index: index, name: data)
                    cell.badge.addArrangedSubview(badgeLabel)
                }
                return
            }
        }
        
        return cell
    }
    
    // 탭 제스처 따로 분리
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! HeaderCollectionReusableView
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        header.isUserInteractionEnabled = true
        header.addGestureRecognizer(tapGesture)
        header.headerLabel.text = "\(foodHeaders[indexPath.section])"
        sectionNumber = indexPath.section
        return header
    }
    
    @objc func labelTapped() {
        Toast(text: "\(foodHeaders[sectionNumber])").show()
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
            
            self.sections.append(foodResponse.body)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        dataTask.resume()
    }
}


//extension ViewController {
//    func makeRoundLabel(text: String, index: Int) -> UILabel {
//        let firstLabel = UILabel()
//        firstLabel.font = UIFont.systemFont(ofSize: 8, weight: .bold, width: .standard)
//        firstLabel.textColor = .white
//        firstLabel.text = text
//        firstLabel.layer.cornerRadius = firstLabel.bounds.height / 2
//        firstLabel.layer.masksToBounds = true
//        firstLabel.backgroundColor = UIColor(named: "Primary200")
//        
//        return firstLabel
//    }
//}
