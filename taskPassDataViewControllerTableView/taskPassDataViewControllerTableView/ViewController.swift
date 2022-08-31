//
//  ViewController.swift
//  taskPassDataViewControllerTableView
//
//  Created by Hashone 07 on 01/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    struct employee{
        var name : String
        var age : Int
    }
        
    var employeeArray : [employee] =  [
        employee(name: "Manoj", age: 25),
        employee(name: "Nitin", age: 29),
        employee(name: "Chirag", age: 25),
        employee(name: "Vishva", age: 28),
        employee(name: "Jaideep", age: 24),
        employee(name: "Ashray", age: 24),
        employee(name: "Pratik", age: 29),
        employee(name: "Gopal", age: 34),
        employee(name: "Yogita", age: 23),
        employee(name: "Ubed", age: 22),
        employee(name: "Tarang", age: 28),
        employee(name: "Kamlesh", age: 30),
        employee(name: "Kailash", age: 32),
        employee(name: "Priya", age: 23),
        employee(name: "Ayushi", age: 24),
        employee(name: "Avinash", age: 32),
        employee(name: "Kishan", age: 33),
        employee(name: "Krupali", age: 27),
        employee(name: "Prince", age: 33)
    ]

    var namesArray = [String]()
    
    
    let nameButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Name", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    let ageButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Age", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.tag = 2
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue

        //Name Button-------
        nameButton.frame = CGRect(x: 30, y: 50, width: view.frame.width-60, height: 100)
        nameButton.layer.cornerRadius = 50
        view.addSubview(nameButton)

        //AgeButton------------
        ageButton.frame = CGRect(x: 30, y: 200, width: view.frame.width-60, height: 100)
        ageButton.layer.cornerRadius = 50
        view.addSubview(ageButton)


//Fill Name Array -----------------
        for i in 0..<employeeArray.count{
            namesArray.append(employeeArray[i].name)
        }

    }
    
    @objc func buttonTapped(_ sender : UIButton){
        
        if sender.tag == 1{
            var ageArray = [String]()

            for _ in 0..<employeeArray.count{
                ageArray.append("")
            }

            let vc = secondViewController(names: namesArray, ages: ageArray)
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        if sender.tag == 2{
            var ageArray = [String]()
            for i in 0..<employeeArray.count{
                ageArray.append("\(employeeArray[i].age)")
            }

            let vc = secondViewController(names: namesArray, ages: ageArray)
            navigationController?.pushViewController(vc, animated: true)
            
        }


    }

}


//----------------------------------------------

class secondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let names : [employee]
    let ages : [String]

    init(names:[String], ages: [String]){
        self.names = names
        self.ages = ages
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableview = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.frame = view.bounds
        tableview.separatorColor = .clear
        tableview.register(CustomcTableViewCell.self , forCellReuseIdentifier: CustomcTableViewCell.identifier)
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomcTableViewCell.identifier, for: indexPath) as? CustomcTableViewCell else {return UITableViewCell()}
        
        cell.nameLabel.text = names[indexPath.row]
        cell.ageLabel.text = "\(ages[indexPath.row])"
                
        return cell
    }
    
}


class CustomcTableViewCell : UITableViewCell{
    
    static let identifier = "CustomTabelViewCell"
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let ageLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(ageLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.frame = CGRect(x: 0, y: 0, width: contentView.frame.width/2, height: contentView.frame.height/2)
        
        ageLabel.frame = CGRect(x: contentView.frame.width/2, y:0, width: contentView.frame.width/2, height: contentView.frame.height/2)

        
    }
    
}

