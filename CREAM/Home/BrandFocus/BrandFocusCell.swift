//
//  BrandFocusCell.swift
//  CREAM
//
//  Created by kant on 2022/10/03.
//

import UIKit

final class BrandFocusCell: UITableViewCell {
    
    static let identifier = "BrandFocusCell"
    
    let itemColors = [UIColor.red, UIColor.yellow, UIColor.green]
    
    let brandArray = [BrandFocusModel(name: "애플"),
                      BrandFocusModel(name: "에르메스"),
                      BrandFocusModel(name: "샤넬"),
                      BrandFocusModel(name: "롤렉스"),
                      BrandFocusModel(name: "루이비통"),
                      BrandFocusModel(name: "까르띠에"),
                      BrandFocusModel(name: "프라다"),
                      BrandFocusModel(name: "셀린느"),
                      BrandFocusModel(name: "발렌시아가"),
                      BrandFocusModel(name: "톰브라운")]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.register(BrandFocusCollectionViewCell.self, forCellWithReuseIdentifier: BrandFocusCollectionViewCell.identifier)
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

extension BrandFocusCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brandArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandFocusCollectionViewCell.identifier, for: indexPath) as! BrandFocusCollectionViewCell
        cell.configure(with: brandArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 60.0
        let height = 53.0
        
        return CGSize(width: width, height: height)
    }
}
