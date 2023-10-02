//
//  HomeSwiftUIView.swift
//  Pi
//
//  Created by jacob on 2023/9/15.
//

import SwiftUI

struct GradeUIView: View {
    @EnvironmentObject var appData: AppData

    var body: some View {
        if let selectedGrade = appData.selectedGrade {
            NavigationView {
                List {
                    ForEach(selectedGrade.chapters) { chapter in
                        Section {
                            ForEach(chapter.questions) { question in
                                NavigationLink(destination: QuestionDetailUIView(questionId: question.id), label: {
                                    Text(question.title)
                                })
//                                    .onTapGesture {
//                                        Task {
//                                            let result = await MathEngine.shared.fetchQuestion(questionID: question.id)
//                                            switch result {
//                                            case .success(let question):
//                                                let questionDetailUI = QuestionDetailUIView(question: question)
//                                                // 打开问题详情界面
//
//                                            case .failure(let error):
//                                                print(error.localizedDescription)
//                                            }
//                                        }
//                                        ProgressHUD.show("Loading")
//                                    }
                            }
                        } header: {
                            Text(chapter.description)
                        }
                    }
                }
                .navigationTitle(appData.selectedGrade.description)
                .toolbar(content: {
                    ToolbarItem(placement: .navigation) {
                        Button {
                            appData.showGradeList = true
                        } label: {
                            Text("Select Grade")
                        }
                    }
                })
            }
        }
    }
}
//
//struct HomeSwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        GradeUIView()
//    }
//}
