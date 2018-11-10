//
//  ToggleCollectionViewCell.swift
//  Resume Filter Hackday
//
//  Created by Zhandos Bolatbekov on 11/10/18.
//  Copyright © 2018 zhandos. All rights reserved.
//

import UIKit

class ToggleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var toggle: UISwitch!
    
    var onToggleStateChanged: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        toggle.tintColor = UIColor.tint
        toggle.onTintColor = UIColor.tint
        
        backView.layer.cornerRadius = 8
        backView.drawShadow()
    }
    
    @IBAction func toggleStateChanged(_ sender: UISwitch) {
        onToggleStateChanged?(toggle.isOn)
    }
}
