//
//  ContentView.swift
//  Course_data
//
//  Created by Hugo Czerniawski on 21/04/2022.
//

import SwiftUI

struct CourseListView: View {
    
    @State var courses: [Course] = []
    
    var body: some View {
        if courses.count == 0 {
            VStack {
                ProgressView()
                    .padding()
                Text("Talking with the interwebs...")
                    .foregroundColor(.purple)
                    .onAppear(perform: {
                        getCourses()
                    })
            }
        }else{
            ScrollView{
                VStack(spacing:15) {
                    ForEach(courses) {listedCourse in
                        CourseTileView(course: listedCourse)
                    }
                }
            }
        }
    }
    
    func getCourses() {
        
        if let apiURL = URL(string: "https://zappycode.com/api/courses?format=json") {
            
            var request = URLRequest(url: apiURL)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) {
                (data, response, error) in
                
                if error != nil {
                    print("There was an error")
                } else if data != nil {
                    //                    print(String(data: data!, encoding: .utf8) ?? "Error")
                    
                    if let coursesFromAPI = try? JSONDecoder()
                        .decode([Course].self, from: data!){
                        print(coursesFromAPI)
                        courses = coursesFromAPI
                    }
                    
                }
                
            }.resume()
        }
    }
}


struct Course: Codable, Identifiable {
    var id: Int
    var title: String
    var subtitle: String
    var image: String
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
