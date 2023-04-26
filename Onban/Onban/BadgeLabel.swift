//
//  BadgeLabel.swift
//  Onban
//
//  Created by apple on 2023/04/26.
//

import UIKit
class BadgeLabel: UILabel {
    private static let padding = UIEdgeInsets(top: 2.0, left: 12.0, bottom: 2.0, right: 12.0)
    private static let colorNames = ["SecondaryOrange", "SecondaryYellow", "Primary200"]
    override var intrinsicContentSize: CGSize { // label 뷰의 가로세로 길이 설정
        var contentSize = super.intrinsicContentSize
        contentSize.width += Self.padding.left + Self.padding.right
        contentSize.height += Self.padding.top + Self.padding.bottom
        return contentSize
    }
    
    convenience init(index: Int, name: String) {
        self.init()
        text = name
        font = UIFont.systemFont(ofSize: 8, weight: .bold, width: .standard)
        textColor = .white
        setBackgroundColor(index)
    }
    
    func configure(index: Int, name: String) { // 글자 크기, 굵기, 색 설정
        text = name
        font = UIFont.systemFont(ofSize: 8, weight: .bold, width: .standard)
        textColor = .white
        setBackgroundColor(index)
    }
    
    override func drawText(in rect: CGRect) { // 패딩설정
        super.drawText(in: rect.inset(by: Self.padding))
    }
    
    override func layoutSubviews() { // radius 설정
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }
    
    func setBackgroundColor(_ index: Int) { // 배경색
        let colorName = Self.colorNames[index % Self.colorNames.count]
        self.backgroundColor = UIColor(named: colorName)
    }
}
