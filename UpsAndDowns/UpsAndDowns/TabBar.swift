//
//  TabBar.swift
//  UpsAndDowns
//
//  Created by Suraya Shivji on 11/27/16.
//  Copyright © 2016 Suraya Shivji. All rights reserved.
//

protocol TabBarDelegate {
    func didSelectItem(atIndex: Int)
}

import UIKit
class TabBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    // MARK: Properties
    let identifier = "cell"
//    let darkItems = ["emotionsDark", "languageDark", "toneDark", "profileDark"]
//    let items = ["emotion", "language", "tone", "profile"]
    let darkItems = ["homeDark", "trendingDark", "subscriptionsDark", "accountDark"]
    let items = ["Emotion", "Language", "Social", "Profile"]
    lazy var whiteView: UIView = {
        let wv = UIView.init(frame: CGRect.init(x: 0, y: self.frame.height - 5, width: self.frame.width / 4, height: 5))
        wv.backgroundColor = ColorPalette.segmentGray
        return wv
    }()
    lazy var collectionView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView.init(frame: CGRect.init(x: 0, y: 20, width: self.frame.width, height: (self.frame.height - 20)), collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        // background color of segment nav
        cv.backgroundColor = ColorPalette.lightGray
        cv.isScrollEnabled = false
        return cv
    }()
    var delegate: TabBarDelegate?
    
    // MARK: CollectionView DataSources
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! TabBarCellCollectionViewCell
        
        cell.label.text = items[indexPath.row]
        return cell
    }
    
    // MARK: CollectionView Delegates
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.frame.width / 4, height: (self.frame.height - 20))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(atIndex: indexPath.row)
    }
    
    // MARK: Methods
    func highlightItem(atIndex: Int)  {
        for index in  0...3 {
            let cell = collectionView.cellForItem(at: IndexPath.init(row: index, section: 0)) as! TabBarCellCollectionViewCell
            cell.label.textColor = ColorPalette.darkGray
        }
        let cell = collectionView.cellForItem(at: IndexPath.init(row: atIndex, section: 0)) as! TabBarCellCollectionViewCell
        cell.label.textColor = UIColor.black
    }
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(TabBarCellCollectionViewCell.self, forCellWithReuseIdentifier: identifier)

        self.backgroundColor = ColorPalette.lightGray
        addSubview(self.collectionView)
        addSubview(self.whiteView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// TabBarCell Class
class TabBarCellCollectionViewCell: UICollectionViewCell {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = ColorPalette.lightGray
        let width = (self.contentView.bounds.width) / 2
        let height = (self.contentView.bounds.height - 30) / 2
        label.frame = CGRect.init(x: self.frame.width / 4, y: height, width:60, height:23)
        label.font = UIFont(name: "BrandonText-Bold", size: 15)!
//        let attributedString = NSMutableAttributedString(string: label.text!)
//        attributedString.addAttribute(NSKernAttributeName, value: CGFloat(2.0), range: NSRange(location: 0, length: attributedString.length))
//        label.attributedText = attributedString
        self.contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
