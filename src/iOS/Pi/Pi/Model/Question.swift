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

struct QuestionShort: Codable, Identifiable, Hashable {
    var id:String = ""
    var title:String = ""
}

struct Chapter: Codable,Identifiable, Hashable {
    static func == (lhs: Chapter, rhs: Chapter) -> Bool {
        return lhs.id.uuidString == rhs.id.uuidString
    }
    
    var id: UUID = UUID()
    var description:String = ""
    var questions:[QuestionShort] = []

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decode(String.self, forKey: .description)
        self.questions = try container.decode([QuestionShort].self, forKey: .questions)
    }
}

struct Grade: Codable {
    var description: String
    var chapters: [Chapter] = []
}

struct GradeOption:Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    let name: String
    let url: String
}
