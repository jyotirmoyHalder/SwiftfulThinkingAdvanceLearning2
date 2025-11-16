//
//  KeypathsBootcamp.swift
//  SwiftfulThinkingAdvanceLearning2
//
//  Created by jyotirmoy_halder on 12/11/25.
//

import SwiftUI

struct MyDataModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let count: Int
    let date: Date
}

//struct MovieTitle {
//    let primary: String
//    let seconary: String
//}


extension Array {
    
    mutating func sortByKeyPath<T: Comparable>(_ keypath: KeyPath<Element, T>, ascending: Bool = true) {
        self.sort { item1, item2 in
            let value1 = item1[keyPath: keypath]
            let value2 = item2[keyPath: keypath]
            return ascending ? (value1 < value2) : (value1 > value2)
        }
    }
    
    func sortedByKeyPath<T: Comparable>(_ keypath: KeyPath<Element, T>, ascending: Bool = true) -> [Element] {
        self.sorted { item1, item2 in
            let value1 = item1[keyPath: keypath]
            let value2 = item2[keyPath: keypath]
            return ascending ? (value1 < value2) : (value1 > value2)
        }
    }
    
}

struct KeypathsBootcamp: View {
    
//    @Environment(\.dismiss) var dismiss
    @AppStorage("user_count") var userCount: Int = 0
//    @State private var screenTitle: String = ""
    
    @State private var dataArray: [MyDataModel] = []
    
    var body: some View {
        List(content: {
            ForEach(dataArray) { item in
                VStack(alignment: .leading) {
                    Text(item.id)
                    Text(item.title)
                    Text("\(item.count)")
                    Text(item.date.description)
                }
                .font(.headline)
            }
        })
        .onAppear {
            var array = [
                MyDataModel(title: "One", count: 1, date: .now),
                MyDataModel(title: "Two", count: 2, date: .distantPast),
                MyDataModel(title: "Three", count: 3, date: .distantFuture)
            ]
            
//            let newArray = array.sorted { item1, item2 in
//                return item1.count < item2.count
//            }
            
//            let newArray = array.sorted { item1, item2 in
//                return item1[keyPath: \.count] < item2[keyPath: \.count]
//            }
            
//            let newArray = array.sortedByKeyPath(\.date, ascending: false)
            
            array.sortByKeyPath(\.count)
            dataArray = array
            //                let title = item.title
            //                let title2 = item[keyPath: \.title]
            //                screenTitle = title2
        }
    }
}

#Preview {
    KeypathsBootcamp()
}
