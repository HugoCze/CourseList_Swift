//
//  CourseTileView.swift
//  Course_data
//
//  Created by Hugo Czerniawski on 21/04/2022.
//

import SwiftUI

struct CourseTileView: View {
    
    var course: Course
    
    var body: some View {
        AsyncImage(url: URL(string: course.image)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            default:
                VStack {
                    Spacer()
                    HStack {
                        VStack(alignment: .leading, spacing:0) {
                        Text(course.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 5)
                            .padding(.top, 5)
                            Text(course.subtitle)
                                .foregroundColor(.white)
                                .padding(.horizontal, 5)
                        }
                        Spacer()
                    }
                    .background(Color.purple.opacity(0.8))
                }
                
            }
        }
    }
}

struct CourseTileView_Previews: PreviewProvider {
    static var previews: some View {
        CourseTileView(course: Course(id: 5, title: "Hello", subtitle: "String", image: "String"))
    }
}
