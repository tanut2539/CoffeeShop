//
//  CoffeeViewController.swift
//  CoffeeShop-MVVM
//
//  Created by tanut2539 on 1/25/18.
//  Copyright © 2018 Tanut Leelaparsert. All rights reserved.
//

import UIKit
import IGListKit

class CofeeViewController: BaseViewController {
    
    lazy var viewModel: CoffeeViewModelProtocol = CoffeeViewModel(delegate: self)
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getListCoffeeService()
        setCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    override func onDataDidLoad() {
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    override func onDataDidLoadErrorWithMessage(errorMessage: String) {
        
    }
    
    func setCollectionView() {
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.scrollViewDelegate = self
        adapter.dataSource = self
        collectionView.frame = view.bounds
    }
    
}

extension CofeeViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.viewModel.coffee
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is String:
            return LoadingSectionController()
        case is CoffeeModel:
            let sectionController = CoffeeSectionController()
            sectionController.delegate = self as? CoffeeSectionControllerDelegate
            return sectionController
        default:
            return ListSectionController()
        }
        
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        let nibView = Bundle.main.loadNibNamed("EmptyView", owner: nil, options: nil)!.first as! EmptyView
        nibView.delegate = self
        return nibView
    }
    
}

extension CofeeViewController: UIScrollViewDelegate, EmptyViewDelegate {
    
    func didReload() {
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        let nextCoffeeAvailable = (self.viewModel.coffee as? [CoffeeModel])?.last?.nextCoffeeAvailable
        if nextCoffeeAvailable == true && distance < 200 {
            self.viewModel.coffee.append(LoadingType.loadmore.rawValue as ListDiffable)
            self.viewModel.getListCoffeeService()
            adapter.performUpdates(animated: true, completion: nil)
        }
    }
    
}
