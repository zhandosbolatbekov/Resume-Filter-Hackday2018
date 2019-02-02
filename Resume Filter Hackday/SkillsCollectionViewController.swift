//
//  SkillsCollectionViewController.swift
//  Resume Filter Hackday
//
//  Created by Zhandos Bolatbekov on 11/10/18.
//  Copyright © 2018 zhandos. All rights reserved.
//

import UIKit

class SkillsCollectionViewController: UIViewController {

    @IBOutlet weak var skillsCollectionView: UICollectionView!
    
    private var skillsData = Skill.allCases.map { SkillData(skill: $0, isChosen: false) }
    private var chosens = Set<Skill>()
    private var combined = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        skillsCollectionView.delegate = self
        skillsCollectionView.dataSource = self
        
        setNavigationBar()
    }
    
    @IBAction func getResultsButtonPressed(_ sender: UIButton) {
        let resumeListVC = self.storyboard?.instantiateViewController(withIdentifier: "Results List") as! ResultsViewController
        let resumeList = Resume.getAllResumes()
        resumeListVC.resumeList = resumeList.filter { $0.contains(skills: chosens, combined: combined) }
        self.navigationController?.pushViewController(resumeListVC, animated: true)
    }
}

extension SkillsCollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            return
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Skill Cell", for: indexPath) as! SkillCollectionViewCell
            let data = skillsData[indexPath.row]
            if chosens.contains(data.skill) {
                chosens.remove(data.skill)
            } else {
                chosens.insert(data.skill)
            }
            skillsData[indexPath.row].isChosen = chosens.contains(data.skill)
            
            cell.data = skillsData[indexPath.row]
            collectionView.reloadData()
            print(chosens)
        default:
            fatalError("INCORRECT SECTION INDEX")
        }
    }
    
    // LAYOUT
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            let width: CGFloat = self.view.frame.size.width - 16 - 8
            let height: CGFloat = 76
            return CGSize(width: width, height: height)
        case 1:
            let width: CGFloat = (self.view.frame.size.width - 16 - 20) / 2
            let height: CGFloat = 76
            return CGSize(width: width, height: height)
        default:
            fatalError("INCORRECT SECTION INDEX")
        }
    }
    
    // DATA SOURCE
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return skillsData.count
        default:
            fatalError("INCORRECT SECTION INDEX")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Toggle Cell", for: indexPath) as! ToggleCollectionViewCell
            cell.onToggleStateChanged = { [unowned self] combined in
                self.combined = combined
            }
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Skill Cell", for: indexPath) as! SkillCollectionViewCell
            cell.data = skillsData[indexPath.row]
            return cell
        default:
            fatalError("INCORRECT SECTION INDEX")
        }
    }
}

extension UIViewController {
    func setNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .white
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "logo")
        imageView.image = image
        
        navigationItem.titleView = imageView
    }
}
