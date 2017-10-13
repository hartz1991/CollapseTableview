//
//  ViewController.swift
//  CollapseExpandeTableview
//
//  Created by Cools on 10/11/17.
//  Copyright © 2017 Cools. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ExpandableHeaderViewDeleagte {
    @IBOutlet var tblCollapse : UITableView!
    var sections = [
        Section(name: "One", items: ["dsfkdjs","dsfdsf","sdfds"], collapsed: false),
        Section(name: "Two", items: ["dsfkdjs","dsfdsf","sdfds"], collapsed: false),
        Section(name: "Three", items: ["dsfkdjs","dsfdsf","sdfds"], collapsed: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.section].collapsed
        {
            return 44
        }
        else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.custominit(title: sections[section].name, section: section, delegate: self)
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        
        let temp = sections[indexPath.section].items
        
        cell.textLabel?.text = temp?[indexPath.row] as? String
        return cell
    }
    
    func togglesection(header: ExpandableHeaderView, section: Int) {
        sections[section].collapsed = !sections[section].collapsed
        for i in 0..<sections[section].items.count
        {
            tblCollapse.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
    }

}

