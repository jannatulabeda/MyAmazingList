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

    let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
    let amazingListVM = AmazingListVM()
    
    var topRatedList = [TopRatedCellVM]()
    var amazingPlaceList = [PlaceTableCellVM]()

    var getTopRatedListTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Amazing places"
        
        // Top rated list in CollectionView
        setupCollectionView()
        setupTableView()

        ProgressHUD.shared.show()
        requestForTopRatedList()
        concurrentQueue.async {
            self.amazingListVM.requestForPlaceList { (placeList) in
                if let _placeList = placeList {
                    self.amazingPlaceList = _placeList
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        ProgressHUD.shared.hide()
                    }
                }
            }
        }
        getTopRatedListTimer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(requestForTopRatedList), userInfo: nil, repeats: true)
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: "TopRatedCell", bundle: nil), forCellWithReuseIdentifier: "TopRatedCell")
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "PlaceTableCell", bundle: nil), forCellReuseIdentifier: "PlaceTableCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    @objc func requestForTopRatedList() {
        concurrentQueue.async {
            self.amazingListVM.requestForTopRatedList(completion: { (topRatedPlaceList) in
                if let _topRatedList = topRatedPlaceList {
                    self.topRatedList = _topRatedList
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            })
        }
    }
}

extension AmazingListVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topRatedList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let returnSize = CGSize(width: 70.scale(), height: 70.scale())
        return returnSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopRatedCell", for: indexPath) as? TopRatedCell {
            if topRatedList.count > 0 {
                cell.updateData(info: topRatedList[indexPath.row])
            }
            cell.layoutIfNeeded()
            return cell
        } else {
            return TopRatedCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = UIStoryboard(name: "DetailOnWebView", bundle: nil).instantiateViewController(withIdentifier: "DetailOnWebVC") as? DetailOnWebVC {
            if topRatedList[indexPath.row].url.count > 0 {
                viewController.webLink = topRatedList[indexPath.row].url
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}

extension AmazingListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return amazingPlaceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableCell", for: indexPath) as? PlaceTableCell {
            if amazingPlaceList.count > 0 {
                cell.updateData(info: amazingPlaceList[indexPath.row])
            }
            return cell
        } else {
            return PlaceTableCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = UIStoryboard(name: "DetailOnWebView", bundle: nil).instantiateViewController(withIdentifier: "DetailOnWebVC") as? DetailOnWebVC {
            if amazingPlaceList[indexPath.row].url.count > 0 {
                viewController.title = amazingPlaceList[indexPath.row].title
                viewController.webLink = amazingPlaceList[indexPath.row].url
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}
