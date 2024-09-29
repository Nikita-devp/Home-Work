//
//  ViewController.swift
//  HW14
//
//  Created by Злата Лашкевич on 29.09.24.
//

import UIKit

class CollectionViewController: UIViewController {
    
    lazy var MarkAutoData: [String] = ["BMW", "Audi", "Mercedes-Benz", "Porshe", "Avatr"]
    
    lazy var viewCellIdentifire = "CELL"
    
    private lazy var customCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let customCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        customCollectionView.register(Cell.self, forCellWithReuseIdentifier: viewCellIdentifire)
        customCollectionView.delegate = self
        customCollectionView.dataSource = self
        return customCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customCollectionView)
        customCollectionView.frame = view.bounds
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MarkAutoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = customCollectionView.dequeueReusableCell(withReuseIdentifier: viewCellIdentifire, for: indexPath) as? Cell else {return UICollectionViewCell()}
        let imageLogo = UIImage(named: MarkAutoData[indexPath.item])
        cell.configuration(ImageMarkAutoLogo: imageLogo ?? UIImage(), labelMarkAutoName: MarkAutoData[indexPath.item])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            CGSize(width: 150, height: 150)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            10
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            10
    }
}
