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
                                Text(question.title)
                            }
                        } header: {
                            Text(chapter.description)
                        }

                    }
                }
            }

//            if !selectedGrade.chapters.isEmpty {
//                let firstChapter = selectedGrade.chapters.first!
//                if !firstChapter.questions.isEmpty {
//                    NavigationView {
//                        List(firstChapter.questions) { question in
//                            Text(question.title)
//                        }
//                        .navigationTitle(appData.selectedGrade.description)
//                    }
//
//                }
//            }
        }
    }
}

struct HomeSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GradeUIView()
    }
}
