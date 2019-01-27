//
//  ViewController.swift
//  FriendFace
//
//  Created by Angel Vázquez on 1/27/19.
//  Copyright © 2019 Angel Vázquez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchResultsUpdating {
	
	let dataSource = FriendDataSource()
	
	var friends = [Friend]()
	var filteredFriends = [Friend]()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		dataSource.dataChanged = { [weak self] in
			self?.tableView.reloadData()
		}
		
		dataSource.fetch("https://www.hackingwithswift.com/samples/friendface.json")
		tableView.dataSource = dataSource
		
		//	Include search bar
		let search = UISearchController(searchResultsController: nil)
		search.obscuresBackgroundDuringPresentation = false
		search.searchBar.placeholder = "Find a friend"
		search.searchResultsUpdater = self
		navigationItem.searchController = search
	}
	
	
	func updateSearchResults(for searchController: UISearchController) {
		dataSource.filterText = searchController.searchBar.text
	}
}

