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
/*
struct Question: Codable {
    var id:String = ""
    var type:QuestionType = .single_choice
    var description: String = ""
    var images: [String] = []
    var answer_options: [AnswerOptions] = []
    var explanation: String = ""
    var answer:String = ""


    init?(data: Data) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

            guard let id = json?["id"] as? String,
                  let description = json?["description"] as? String,
                  let images = json?["images"] as? [String],
                  let type = json?["type"] as? String,
                  let explanation = json?["explanation"] as? String
            else {
                return nil
            }

            self.id = id
            self.description = description
            self.images = images
            self.type = QuestionType(rawValue: type)!
            if self.type == .fill_in_the_blank {
                if let answer = json?["answer"] as? String {
                    self.answer = answer
                }
            }
            else {
                if let answerOptionsData = json?["answer_options"] as? [[String: Any]] {
                    self.answer_options = answerOptionsData.compactMap { answerOptionData in
                        guard let option = answerOptionData["option"] as? String,
                              let isCorrect = answerOptionData["is_correct"] as? Bool
                        else {
                            return nil
                        }

                        return AnswerOptions(option: option, is_correct: isCorrect)
                    }
                }
            }
            self.explanation = explanation
        } catch {
            print(error.localizedDescription.debugDescription)
            return nil
        }
    }
}
*/


struct Question: Decodable {
    let id: String
    let description: String
    let images: [String]
    let type: QuestionType
    let answer_options: [AnswerOptions]?
    let explanation: String
    let answer: String?

    enum CodingKeys: String, CodingKey {
        case id
        case description
        case images
        case type
        case answer_options
        case explanation
        case answer
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        description = try container.decode(String.self, forKey: .description)
        images = try container.decode([String].self, forKey: .images)
        type = try container.decode(QuestionType.self, forKey: .type)
        explanation = try container.decode(String.self, forKey: .explanation)

        answer_options = try container.decodeIfPresent([AnswerOptions].self, forKey: .answer_options)
        answer = try container.decodeIfPresent(String.self, forKey: .answer)
    }
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
