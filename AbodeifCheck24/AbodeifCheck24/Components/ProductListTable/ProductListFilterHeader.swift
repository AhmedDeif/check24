//
//  ProductListFilterHeader.swift
//  AbodeifCheck24
//
//  Created by Ahmed Abodeif on 5/23/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import UIKit

class ProductListFilterHeader: UITableViewHeaderFooterView {
    
    @IBAction func didTapFilter(_ sender: UISegmentedControl) {
        print(sender.titleForSegment(at: sender.selectedSegmentIndex))
    }
    
    
   
}
