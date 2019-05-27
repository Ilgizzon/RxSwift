//
//  ViewController.swift
//  testWork
//
//  Created by Ильгиз Фазлыев on 27.06.2018.
//  Copyright © 2018 Ilgizzon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController {

    private let bag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    public var viewModel: ViewControllerModelI!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(R.nib.cell(), forCellReuseIdentifier: R.reuseIdentifier.cell.identifier)
        bindViewModelOutput()
        
        setNavigationBar()
        
        
    }
    
    func setNavigationBar() {
        let navItem = UINavigationItem(title: "")
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.refresh, target: nil, action: nil)
        navItem.rightBarButtonItem = doneItem
        navigationBar.setItems([navItem], animated: false)
        navItem.rightBarButtonItem?.rx.tap.subscribe(onNext: { [weak self] in
            self?.viewModel?.loadingData(fromUI: true)
        }).disposed(by: bag)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }

    private func bindViewModelOutput() {
        viewModel.itemsData.asObservable().bind(to: tableView.rx
            .items(cellIdentifier: R.reuseIdentifier.cell.identifier, cellType: Cell.self)) { row, oneItems, cell in
                cell.setItem(oneItems)
            }.disposed(by: bag)
        viewModel.loadingState.asObservable()
            .subscribe(onNext: { [weak self] state in
                self?.setState(state)
            }).disposed(by: bag)
    }
    
    private func setState(_ state: ViewControllerStateType) {
        switch(state) {
        case .none:
            showLoading(true)
        case .loading(let show):
            showLoading(show)
        }
    }
    
    private func showLoading(_ show: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.tableView.alpha = show == true ? 0.6 : 1
            if show == true {
                self.activityInd.startAnimating()
            } else {
                self.activityInd.stopAnimating()
            }
        }
    }
    

}



