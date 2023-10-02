//
//  QuestionDetailUIView.swift
//  Pi
//
//  Created by jacob on 2023/9/26.
//

import SwiftUI
//import ProgressHUD

struct QuestionDetailUIView: View {
    var questionId: String
    @State var question: Question?
    var body: some View {
        if question != nil {
            Text(question!.description)
        }
        Text("")
            .onAppear() {
                if question == nil {
                    Task {
                        let result = await MathEngine.shared.fetchQuestion(questionID: questionId)
                        switch result {
                        case .success(let question):
                            self.question = question
                            // 打开问题详情界面
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
            }

//        if question == nil {
//            ProgressHUD.show("Loading")
//        }
//        else
//        {
//
//        }
    }
}
