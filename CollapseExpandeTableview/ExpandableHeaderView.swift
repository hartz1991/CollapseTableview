//
//  ExpandableHeaderView.swift
//  CollapseExpandeTableview
//
//  Created by Cools on 10/11/17.
//  Copyright © 2017 Cools. All rights reserved.
//

import UIKit

protocol ExpandableHeaderViewDeleagte {
    func togglesection(header: ExpandableHeaderView, section : Int)
}

class ExpandableHeaderView: UITableViewHeaderFooterView {

    var delagete : ExpandableHeaderViewDeleagte?
    var section : Int!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func custominit(title: String, section: Int, delegate: ExpandableHeaderViewDeleagte)
    {
        self.textLabel?.text = title
        self.section = section
        self.delagete = delegate
    }
    
    func selectHeaderAction(gestureRecongnizer:UITapGestureRecognizer)
    {
        let cell = gestureRecongnizer.view as! ExpandableHeaderView
        delagete?.togglesection(header: self, section: cell.section)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
