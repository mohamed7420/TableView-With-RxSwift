//
//  ViewController.swift
//  TableViewWithRxSwift
//
//  Created by Mohamed osama on 29/03/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let developersRelay = BehaviorRelay<[Developer]>(value: [])
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        developersRelay.accept([Developer(name: "Mohamed", title: "Senior iOS Developer"),Developer(name: "Mohamed", title: "Senior iOS Developer"),Developer(name: "Mohamed", title: "Senior iOS Developer"),Developer(name: "Mohamed", title: "Senior iOS Developer"),Developer(name: "Mohamed", title: "Senior iOS Developer"),Developer(name: "Mohamed", title: "Senior iOS Developer"),Developer(name: "Mohamed", title: "Senior iOS Developer"),Developer(name: "Mohamed", title: "Senior iOS Developer"),Developer(name: "Mohamed", title: "Senior iOS Developer")])
        populateTableView()
    }

    private func populateTableView(){
        developersRelay.bind(to: tableView.rx.items(cellIdentifier: "cell")){
            (tv , developer , cell) in
            
            cell.textLabel?.text = "\(developer.name), \(developer.title)"
            
        }.disposed(by: disposeBag)
    }
}

