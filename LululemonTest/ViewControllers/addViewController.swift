//
//  addViewController.swift
//  LululemonTest
//
//  Created by 李金龙 on 14/11/1400 AP.
//
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    @IBOutlet weak var btnAddUpdate: UIButton!
    @IBOutlet weak var txtName: UITextField!
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var item:Item?
    let vm = AddViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUphideKeyboard()
    }
    
    func setUphideKeyboard() {
        let tapGest = UITapGestureRecognizer.init(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGest)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        txtName.becomeFirstResponder() //open keyboard
    }
    
    @IBAction func save(_ sender: UIButton) {
        
        let name = txtName.text
        guard let n = name else {
            print("please enter name")
            return
        }
        
    
        vm.saveItem(itemName: n)
        navigationController?.popViewController(animated: true)
    }

}
