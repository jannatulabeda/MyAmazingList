//
//  AmazingListVC.swift
//  MyAmazingList
//
//  Created by Jannatul Abeda on 2019/08/24.
//  Copyright © 2019 Jannatul Abeda. All rights reserved.
//

import UIKit

class AmazingListVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!

    let amazingListAPI = AmazingListAPI()
    var amazingTopRatedList: [AmazingListRM]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // CollectionView
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        amazingListAPI.doGetAmazingPlaceList { amazingPlaceList in
            self.amazingTopRatedList = amazingPlaceList
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        // TableView
        tableView.register(UINib(nibName: "AmazingTableCell", bundle: nil), forCellReuseIdentifier: "AmazingTableCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.reloadData()
    }
}

extension AmazingListVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let returnSize = CGSize(width: 70.scale(), height: 70.scale())
        return returnSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell {
            
        
            if amazingTopRatedList != nil {
                let topRatedPlace = amazingTopRatedList![indexPath.row]
                let url = URL(string: topRatedPlace.image_url!)
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                cell.imageView.image = UIImage(data: data!)
            }
            cell.layoutIfNeeded()
            return cell
        } else {
            return CollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = UIStoryboard(name: "DetailOnWebView", bundle: nil).instantiateViewController(withIdentifier: "DetailOnWebVC") as? DetailOnWebVC {
            viewController.webLink = amazingTopRatedList![indexPath.row].url!
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension AmazingListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AmazingTableCell", for: indexPath) as? AmazingTableCell {
            return cell
        } else {
            return AmazingTableCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
