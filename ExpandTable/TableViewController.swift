//
//  ViewController.swift
//  ExpandTable
//
//  Created by Gabriel Taques on 01/09/19.
//  Copyright © 2019 Gabriel Taques. All rights reserved.
//

import UIKit

struct cellData {
    var opened: Bool!
    var title: String!
    var sectionData: [String]
}

class TableViewController: UITableViewController {

    var tableViewData: [cellData]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "CoolTableViewCell", bundle: nil), forCellReuseIdentifier: "coolCell")
        tableView.register(UINib(nibName: "ContentTableViewCell", bundle: nil), forCellReuseIdentifier: "contentCell")
        
        tableViewData = [
            cellData(opened: false, title: "Viagem 01", sectionData: ["Transporte", "Ingresso", "Alimentacao", "Transporte"]),
            cellData(opened: false, title: "Viagem 02", sectionData: ["Transporte", "Ingresso", "Alimentacao", "Transporte"]),
            cellData(opened: false, title: "Viagem 03", sectionData: ["Transporte", "Ingresso", "Alimentacao", "Transporte"]),
            cellData(opened: false, title: "Viagem 04", sectionData: ["Transporte", "Ingresso", "Alimentacao", "Transporte"])
        ]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "coolCell") as! CoolTableViewCell
            cell.awesomeLabel.text = tableViewData[indexPath.section].title
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell") as? ContentTableViewCell else { return UITableViewCell()}
            //cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
    }
}

