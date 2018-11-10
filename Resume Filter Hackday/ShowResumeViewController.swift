//
//  ShowResumeViewController.swift
//  Resume Filter Hackday
//
//  Created by Zhandos Bolatbekov on 11/10/18.
//  Copyright © 2018 zhandos. All rights reserved.
//

import UIKit
import PDFKit

class ShowResumeViewController: UIViewController {

    @IBOutlet weak var pdfView: PDFView!
    
    var resume: Resume!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pdfView.document = resume.pdf
        
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        pdfView.autoScales = true
        pdfView.maxScaleFactor = 4
        pdfView.minScaleFactor = pdfView.scaleFactorForSizeToFit
        
        navigationItem.title = resume.name
    }
}
