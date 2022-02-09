//
//  ViewController.swift
//  LululemonTest
//
//  Created by 李金龙 on 14/11/1400 AP.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var arr = [Item]()
    let vm = ListModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        segment.selectedSegmentIndex = 0
        addOrEditHobby()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        vm.getDatabaseInfo(num: segment.selectedSegmentIndex)
        tblView.reloadData()
    }
    

   
    @IBAction func segmentChanged(_ sender: Any) {
    
        vm.getDatabaseInfo(num: segment.selectedSegmentIndex)
        tblView.reloadData()
    }
    
    
    func addOrEditHobby() {
        let btn = UIBarButtonItem.init(title: "ADD", style: .plain, target: self, action: #selector(openAddNeworEditHobbyVC))
        navigationItem.rightBarButtonItem = btn
    }
    
    
    @objc func openAddNeworEditHobbyVC() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "AddViewController")
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return vm.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let person = vm.getName(index: indexPath.row)
        let name = person ?? "NA"
        let dispayString = name
        cell?.textLabel?.text = dispayString
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let person = arr[indexPath.row]
            arr.remove(at: indexPath.row)
            appdelegate.getViewContext().delete(person)
            appdelegate.saveContext()
            tblView.reloadData()
        }
    }
    
}
