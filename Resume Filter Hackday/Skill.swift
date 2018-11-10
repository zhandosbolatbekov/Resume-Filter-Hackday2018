//
//  Skill.swift
//  Resume Filter Hackday
//
//  Created by Zhandos Bolatbekov on 11/10/18.
//  Copyright © 2018 zhandos. All rights reserved.
//

enum Skill: Int {
    case machineLearning
    case django
    case ios
    case android
    case javaScript
    case cpp
    case algoDataStr
    case oop
    case math
    case dataScience
    case networks
    
    static var allCases: [Skill] {
        var values = [Skill]()
        var index = 0
        while let element = self.init(rawValue: index) {
            values.append(element)
            index += 1
        }
        return values
    }
    
    var name: String {
        switch self {
        case .algoDataStr: return "Algorithms and data structures"
        case .android: return "Android development"
        case .cpp: return "C++"
        case .dataScience: return "Data science"
        case .django: return "Django"
        case .ios: return "iOS development"
        case .javaScript: return "JavaScript"
        case .machineLearning: return "Machine learning"
        case .math: return "Math"
        case .networks: return "Computer networks"
        case .oop: return "Object Oriented Programming"
        }
    }
    
    var keywords: [String] {
        switch self {
        case .algoDataStr: return ["algorithms", "data structures"]
        case .android: return ["android"]
        case .cpp: return ["c++"]
        case .dataScience: return ["data science"]
        case .django: return ["django"]
        case .ios: return ["ios"]
        case .javaScript: return ["javascript"]
        case .machineLearning: return ["machine learning"]
        case .math: return ["math"]
        case .networks: return ["networks"]
        case .oop: return ["object oriented orogramming", "oop"]
        }
    }
}
