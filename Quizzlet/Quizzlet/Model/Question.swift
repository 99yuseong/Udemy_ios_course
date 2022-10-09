//
//  Question.swift
//  Quizzlet
//
//  Created by 남유성 on 2022/10/08.
//

import Foundation

struct Question {
    let question: String
    let answer: String
    
    init(q: String, a: String) {
        self.question = q
        self.answer = a
    }
}
