//
//  ResumeTableViewCell.swift
//  Resume Filter Hackday
//
//  Created by Zhandos Bolatbekov on 11/11/18.
//  Copyright © 2018 zhandos. All rights reserved.
//

import UIKit

class ResumeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var resumeImageView: UIImageView!
    @IBOutlet weak var resumeNameLabel: UILabel!
    
    var resume: Resume! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        resumeNameLabel.text = resume.name
//        resumeImageView.image = PDFHelper.drawPDFfromURL(url: resume.url)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        resumeImageView.image = UIImage(named: "doc_gray")
        backView.layer.cornerRadius = 8
        backView.drawShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
