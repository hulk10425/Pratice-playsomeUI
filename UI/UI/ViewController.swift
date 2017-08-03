//
//  ViewController.swift
//  UI
//
//  Created by 陳遵丞 on 2017/8/3.
//  Copyright © 2017年 hulk. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchResultsUpdating {
    var searchController: UISearchController!
    var searchResults:[Candy] = []
    var button = UIButton()
    let controller = WebViewController()
    

    
    var candies = [
    Candy(category:"Chocolate", name:"Chocolate Bar"),
    Candy(category:"Chocolate", name:"Chocolate Chip"),
    Candy(category:"Chocolate", name:"Dark Chocolate"),
    Candy(category:"Hard", name:"Lollipop"),
    Candy(category:"Hard", name:"Candy Cane"),
    Candy(category:"Hard", name:"Jaw Breaker"),
    Candy(category:"Other", name:"Caramel"),
    Candy(category:"Other", name:"Sour Chew"),
    Candy(category:"Other", name:"Gummi Bear")
    ]
    let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //為啥這行放在    viiewDidLoad外面就不行
        let navController = UINavigationController()
         let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainView = ViewController(nibName: nil, bundle: nil) //ViewController = Name of your controller
        navController.viewControllers = [mainView]
        appDelegate?.window!.rootViewController = navController
       // appDelegate?.window?.makeKeyAndVisible()
        
        
        
        
        
        
        
        
        
        
        
        //tableView.frame = CGRect(x: 10, y: 10, width: 100, height: 500)
        tableView.frame = CGRect(x: 0, y: 0, width:view.frame.width, height: view.frame.height)
        tableView.dataSource = self as! UITableViewDataSource
        tableView.delegate = self as! UITableViewDelegate
        //tableviewcell 一定要加這句話
        tableView.register(CartCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 100
        
        DispatchQueue.main.async {
            self.view.addSubview(self.tableView)
            self.view.bringSubview(toFront: self.tableView)
            self.view.addSubview(self.button)
            self.view.bringSubview(toFront: self.button)
        }
        
        
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        button.frame = CGRect(x: 0, y: 0, width: 37, height: 37)
        button.setImage(UIImage(named: "clipboard"), for: UIControlState())
        button.addTarget(self, action: #selector(checktoWebcontroller), for: .touchUpInside)
    }
    
    func checktoWebcontroller() {
     
        self.present(controller, animated: true, completion: nil)
    }
    

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive {
            return searchResults.count
        } else {
            return candies.count
        }
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdendifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath) as! CartCell
        
        let candy = (searchController.isActive) ? searchResults[indexPath.row] : candies[indexPath.row]
        
        
        //cell.myLabel.text = candies[indexPath.row].name
        
        cell.myLabel.text = candy.name
        //cell.thumbnailImageView.image = UIImage(data: restaurant.image as! Data)
       // cell.locationLabel.text = restaurant.location
        //cell.typeLabel.text = restaurant.type
        
        //cell.accessoryType = restaurant.isVisited ? .checkmark : .none

        
        
        return cell
    }
    
    func filterContent(for searchText: String) {
        searchResults = candies.filter({ (candy) -> Bool in
            if candy.name != nil {
                let isMatch = candy.name.localizedCaseInsensitiveContains(searchText)
                return isMatch
            }
            
            return false
        })
    }
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            tableView.reloadData()
        }
    }

    


}

