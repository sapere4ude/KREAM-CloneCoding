//
//  JustDroppedCollectionViewCell.swift
//  CREAM
//
//  Created by kant on 2022/10/03.
//

import UIKit

final class JustDroppedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "JustDroppedCollectionViewCell"
    
    private let VstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    private let trendingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemBrown
        return imageView
    }()
    
    private let brandLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .left
        title.font = UIFont.systemFont(ofSize: 12)
        title.numberOfLines = 2
        title.lineBreakMode = .byTruncatingTail
        return title
    }()
    
    private let productNameLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .left
        title.font = UIFont.systemFont(ofSize: 12)
        title.numberOfLines = 2
        title.lineBreakMode = .byTruncatingTail
        return title
    }()
    
    private let priceLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .left
        title.font = UIFont.systemFont(ofSize: 12)
        title.numberOfLines = 2
        title.lineBreakMode = .byTruncatingTail
        return title
    }()
    
    private let bookMarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.tintColor = .black
        button.alpha = 1.0
        return button
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(VstackView)
        trendingImage.addSubview(bookMarkButton)
        
        VstackView.translatesAutoresizingMaskIntoConstraints = false
        bookMarkButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            VstackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            VstackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            VstackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            VstackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            VstackView.heightAnchor.constraint(equalToConstant: 230)
        ])
        
        [trendingImage,brandLabel,productNameLabel,priceLabel].forEach {
            VstackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            trendingImage.widthAnchor.constraint(equalToConstant: 200),
            trendingImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            brandLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            productNameLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            bookMarkButton.bottomAnchor.constraint(equalTo: trendingImage.bottomAnchor, constant: -5),
            bookMarkButton.trailingAnchor.constraint(equalTo: trendingImage.trailingAnchor, constant: -5),
            bookMarkButton.widthAnchor.constraint(equalToConstant: 30),
            bookMarkButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    public func configure(with model: JustDroppedModel) {
        brandLabel.text = model.brand
        productNameLabel.text = model.productName
        priceLabel.text = model.price
    }
    
}
