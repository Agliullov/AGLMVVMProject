//
//  ViewController.swift
//  AGLMVVMProject
//
//  Created by Раис Аглиуллов on 22.11.2020.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    
    let dataSource: Observable<[Food]> = Observable.just([
        Food(name: "Деревенская", flickerID: "pizz1"),
        Food(name: "Амазонка", flickerID: "pizz2"),
        Food(name: "Татарская", flickerID: "pizz3")
    ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataSource()
        tapItemInTableView()
    }
    
    private func getDataSource() {
        dataSource.bind(to: tableView.rx.items(cellIdentifier: "TableCell")) { row, foods, cell in
            cell.textLabel?.text = foods.name
            cell.detailTextLabel?.text = foods.flickerID
            cell.imageView?.image = foods.image
        }.disposed(by: disposeBag)
    }
    
    private func tapItemInTableView() {
        tableView.rx.modelSelected(Food.self).subscribe(onNext: {
            print("You selected: \($0)")
        }).disposed(by: disposeBag)
    }
}
