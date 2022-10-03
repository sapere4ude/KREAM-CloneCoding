//
//  BrandFocusCollectionViewCell.swift
//  CREAM
//
//  Created by kant on 2022/10/03.
//

import UIKit

final class BrandFocusCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BrandFocusCollectionViewCell"
    
    private let VstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    private let trendingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 19
        imageView.clipsToBounds = true
        imageView.backgroundColor = .green
        return imageView
    }()
    
    private let title: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 12)
        title.numberOfLines = 2
        title.lineBreakMode = .byTruncatingTail
        return title
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(VstackView)
        
        VstackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            VstackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            VstackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            VstackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            VstackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
        
        [trendingImage,title].forEach {
            VstackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            trendingImage.widthAnchor.constraint(equalToConstant: 38),
            trendingImage.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    public func configure(with model: BrandFocusModel) {
        title.text = model.name
    }
}
