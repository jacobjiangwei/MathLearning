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

struct HomeSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GradeUIView()
    }
}
