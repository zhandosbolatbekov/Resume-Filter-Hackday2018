//
//  ResultsViewController.swift
//  Resume Filter Hackday
//
//  Created by Zhandos Bolatbekov on 11/11/18.
//  Copyright © 2018 zhandos. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var resumeList = Resume.getAllResumes()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        setNavigationBar()
    }
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resumeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "New Resume Cell", for: indexPath) as! ResumeTableViewCell
        cell.resume = resumeList[indexPath.row]
        return cell
    }
}

extension ResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resume = resumeList[indexPath.row]
        guard resume.pdf != nil else {
            print("Resume has not pdf")
            return
        }
        showResume(resume)
    }
    
    private func showResume(_ resume: Resume) {
        let resumeVC = self.storyboard?.instantiateViewController(withIdentifier: "Resume View") as! ShowResumeViewController
        resumeVC.resume = resume
        navigationController?.pushViewController(resumeVC, animated: true)
    }
}


