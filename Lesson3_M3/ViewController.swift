//
//  ViewController.swift
//  Lesson3_M3
//
//  Created by mac on 28/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var namesTableView: UITableView!
    
    var name: [String] = ["Kamila", "Dastan" , "Temirlan", "Aziza", "Gulkaiyr" , "Bermet"]
    
    var addButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //namesTableView.dataSource = self
        namesTableView.delegate = self
        namesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "name_cell")
        
        view.addSubview(addButton)
        addButton.layer.cornerRadius = 80 / 2
        addButton.setTitle("+", for: .normal)
        addButton.backgroundColor = .blue
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }

    
    @objc func addButtonTap() {
        name.insert("Nurmuhammed", at: 0)
        namesTableView.reloadData()
        print(name)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "name_cell", for: indexPath)
        cell.textLabel?.text = name[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let contactInfoVc = storyboard?.instantiateViewController(withIdentifier: "contactInfo_vc") as! SecondViewController
        
        contactInfoVc.info = name[indexPath.row]
        
        navigationController?.pushViewController(contactInfoVc, animated: true)
        //СЮДА ДОБАВИТЬ ЛОГИКУ ПЕРЕДАЧИ ДАННЫХ
    }
}
