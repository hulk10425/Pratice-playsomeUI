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
        }
        
        
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
        
        
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        
        return candies.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdendifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath) as! CartCell
        
        
        cell.myLabel.text = candies[indexPath.row].name
        
        
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

