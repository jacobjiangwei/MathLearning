//
//  Question.swift
//  Pi
//
//  Created by jacob on 2023/9/21.
//

import Foundation

enum QuestionType: String, Codable {
    case multiple_choice = "multiple_choice"
    case true_false = "true_false"
    case fill_in_the_blank = "fill_in_the_blank"
    case single_choice = "single_choice"
}

struct AnswerOptions: Codable {
    var option: String = ""
    var is_correct : Bool = false
}

struct Question: Codable {
    var id:String = ""
    var type:QuestionType = .single_choice
    var description: String = ""
    var images: String = ""
    var answer_options: [AnswerOptions] = []
    var explanation: String = ""
    var asnwer:String = ""
}

struct Chapter: Codable {
    var description:String = ""
    var questionList:[String] = []
}

struct Grade: Codable {
    var description: String
    var chapters: [Chapter] = []
}
