//
//  ResumeListViewController.swift
//  Resume Filter Hackday
//
//  Created by Zhandos Bolatbekov on 11/7/18.
//  Copyright © 2018 zhandos. All rights reserved.
//

import UIKit
import PDFKit

class ResumeListViewController: UIViewController {
    
    @IBOutlet weak var resumeListTableView: UITableView!
    
    var resumeList = Resume.getAllResumes()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resumeListTableView.delegate = self
        resumeListTableView.dataSource = self
    }
    
    @IBAction func closeButtonPressed(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ResumeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resumeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Resume Cell", for: indexPath)
        cell.textLabel?.text = resumeList[indexPath.row].name
        return cell
    }
}

extension ResumeListViewController: UITableViewDelegate {
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


