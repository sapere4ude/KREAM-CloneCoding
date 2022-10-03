//
//  HomeViewController.swift
//  CREAM
//
//  Created by Kant on 2022/05/04.
//

import UIKit

enum Sections: Int {
    case Advertise = 0
    case Trending = 1
    case JustDropped = 2
    case BrandFocus = 3
    case Recommend = 4
    case MostPopular = 5
}

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["Advertise", "Trending", "Just Dropped\n발매상품", "Brand Focus", "Recommend", "Most Popular"]
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(AdvertisementCell.self, forCellReuseIdentifier: AdvertisementCell.identifier)
        table.register(TrendingCell.self, forCellReuseIdentifier: TrendingCell.identifier)
        table.register(JustDroppedCell.self, forCellReuseIdentifier: JustDroppedCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = UITableViewCell()
        
        switch indexPath.section {
        case Sections.Advertise.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: AdvertisementCell.identifier, for: indexPath) as! AdvertisementCell
        case Sections.Trending.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: TrendingCell.identifier, for: indexPath) as! TrendingCell
        case Sections.JustDropped.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: JustDroppedCell.identifier, for: indexPath) as! JustDroppedCell
//        case Sections.Trending.rawValue, Sections.JustDropped.rawValue, Sections.BrandFocus.rawValue, Sections.Recommend.rawValue, Sections.MostPopular.rawValue:
//            cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as! CollectionViewTableViewCell
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case Sections.Advertise.rawValue:
            return 350
        case Sections.Trending.rawValue:
            return 140
        case Sections.JustDropped.rawValue:
            return 300
        case Sections.BrandFocus.rawValue:
            return 300
        case Sections.Recommend.rawValue:
            return 350
        case Sections.MostPopular.rawValue:
            return 350
        default:
            return 150
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case Sections.Advertise.rawValue:
            return 0
        default:
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .systemGray
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
}
