//
//  JustDroppedCell.swift
//  CREAM
//
//  Created by kant on 2022/10/03.
//

import UIKit

final class JustDroppedCell: UITableViewCell {
    
    static let identifier = "JustDroppedCell"
    
    let itemColors = [UIColor.red, UIColor.yellow, UIColor.green]
    
    let justDroppedArray = [JustDroppedModel(imageURL: "", brand: "Stussy", productName: "Stussy Care Label Sweater Natural", price: "330,000원"),
                            JustDroppedModel(imageURL: "", brand: "Nike", productName: "Nike Air Force 1 '07 LV8 White Black", price: "214,000원"),
                            JustDroppedModel(imageURL: "", brand: "Samsung", productName: "Samsug X Helinox The Freestyle Special Edition Pack", price: "1,360,000원"),
                            JustDroppedModel(imageURL: "", brand: "Nike", productName: "(W) Nike Air Force 1 Low Gorge Green", price: "156,000원"),
                            JustDroppedModel(imageURL: "", brand: "Mihara Yasuhiro", productName: "Masion Mihara Yasuhiro Peterson OG Sole Canvas Low-top Sneakers Natural", price: "306,400원")]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}

extension JustDroppedCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return justDroppedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JustDroppedCollectionViewCell.identifier, for: indexPath) as! JustDroppedCollectionViewCell
        cell.configure(with: justDroppedArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = contentView.bounds.width / 2
        let height = contentView.bounds.height
        
        return CGSize(width: width, height: height)
    }
}
