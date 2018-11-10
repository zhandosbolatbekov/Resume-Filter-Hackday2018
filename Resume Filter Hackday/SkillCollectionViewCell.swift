//
//  SkillCollectionViewCell.swift
//  Resume Filter Hackday
//
//  Created by Zhandos Bolatbekov on 11/10/18.
//  Copyright © 2018 zhandos. All rights reserved.
//

import UIKit

class SkillCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var skillNameLabel: UILabel!
    
    var data: SkillData! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        backView.layer.cornerRadius = 8
        backView.drawShadow()
        
        skillNameLabel.text = data.skill.name
        
        if data.isChosen {
            backView.backgroundColor = UIColor.tint
            skillNameLabel.textColor = UIColor.white
        } else {
            backView.backgroundColor = UIColor.white
            skillNameLabel.textColor = UIColor.black
        }
    }
}

extension UIView {
    func drawShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 6
    }
}
