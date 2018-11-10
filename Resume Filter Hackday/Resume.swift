//
//  Resume.swift
//  Resume Filter Hackday
//
//  Created by Zhandos Bolatbekov on 11/8/18.
//  Copyright © 2018 zhandos. All rights reserved.
//

import Foundation
import PDFKit

struct Resume {
    let url: URL
    let pdf: PDFDocument?
    let name: String
    var text: String = ""
    
    init(url: URL) {
        self.url = url
        self.pdf = PDFDocument(url: url)
        if let pdf = self.pdf {
            self.text = PDFHelper.getTextContent(of: pdf)
        }
        self.name = url.lastPathComponent
    }
    
    static func getAllResumes() -> [Resume] {
        let fileURLs = FileManager.getFileURLs()
        return fileURLs.map { Resume(url: $0) }
    }
}

extension Resume {
    func contains(skills: Set<Skill>, combined: Bool) -> Bool {
        if skills.isEmpty {
            return true
        }
        var count = 0
        for skill in skills {
            for key in skill.keywords {
                if text.lowercased().range(of: key) != nil {
                    count += 1
                }
            }
        }
        if combined {
            return count == skills.count
        } else {
            return count > 0
        }
    }
}
