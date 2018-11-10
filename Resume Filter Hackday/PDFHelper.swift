//
//  PDFHelper.swift
//  Resume Filter Hackday
//
//  Created by Zhandos Bolatbekov on 11/8/18.
//  Copyright © 2018 zhandos. All rights reserved.
//

import PDFKit

struct PDFHelper {
    static func getTextContent(of pdf: PDFDocument) -> String {
        let pageCount = pdf.pageCount
        var documentContent = ""
        
        for i in 0 ..< pageCount {
            guard let page = pdf.page(at: i) else { continue }
            guard let pageContent = page.string else { continue }
            documentContent.append(pageContent)
        }
        print("PDF: \(documentContent)")
        return documentContent
    }
}
