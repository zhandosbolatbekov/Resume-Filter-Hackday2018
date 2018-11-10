//
//  FileManagerExtensions.swift
//  Resume Filter Hackday
//
//  Created by Zhandos Bolatbekov on 11/8/18.
//  Copyright © 2018 zhandos. All rights reserved.
//

import Foundation

extension FileManager {
    static func getFileURLs() -> [URL] {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: documentsURL,
                                                                       includingPropertiesForKeys: nil)
            fileURLs.forEach { print($0.absoluteString) }
            return fileURLs
        } catch {
            print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
        }
        return []
    }
}
