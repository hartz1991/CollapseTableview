//
//  Section.swift
//  CollapseExpandeTableview
//
//  Created by Cools on 10/11/17.
//  Copyright © 2017 Cools. All rights reserved.
//

import Foundation

struct Section
{
    var name: String!
    var items: NSMutableArray!
    var collapsed: Bool!
    
    init(name: String, items: NSMutableArray, collapsed: Bool)
    {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}
