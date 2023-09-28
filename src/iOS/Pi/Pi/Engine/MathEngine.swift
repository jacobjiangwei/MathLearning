//
//  MathEngine.swift
//  Pi
//
//  Created by jacob on 2023/9/19.
//

import Foundation


class MathEngine {
    static let shared = MathEngine()
    let appData = AppData()

    private init() {}

    private func fetchJSON(from url: String) async throws -> Data {
        let destinationURL = URL(string: url)!
        let (data, response) = try await URLSession.shared.data(from: destinationURL)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            throw NSError(domain: "HTTPError", code: statusCode, userInfo: nil)
        }
        print(String(data: data, encoding: String.Encoding.utf8)!)
        return data
    }

    func fetchGrade(url:String) async {
        do {
            let jsonData = try await fetchJSON(from: url)
            let grade = try JSONDecoder().decode(Grade.self, from: jsonData as! Data)
            print(grade)
            // 处理 JSON 数据
            DispatchQueue.main.async {
                self.appData.selectedGrade = grade
                self.appData.showGradeList = false
            }
        } catch {
            print(error.localizedDescription.debugDescription)
        }
    }

    func fetchQuestion(questionID:String) async -> Result<Question, Error> {
        do {
            let questionURL = "https://raw.githubusercontent.com/jacobjiangwei/MathLearning/main/data/questions/raw/" + questionID + ".json"
            let jsonData = try await fetchJSON(from: questionURL)
            let question = try JSONDecoder().decode(Question.self, from: jsonData)
            print(question)
            return .success(question)
            // 处理 JSON 数据
        } catch {
            print(error.localizedDescription.debugDescription)
            return .failure(error)
        }
    }
}
