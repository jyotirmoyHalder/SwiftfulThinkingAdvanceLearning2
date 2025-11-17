//
//  SubscriptsBootcamp.swift
//  SwiftfulThinkingAdvanceLearning2
//
//  Created by jyotirmoy_halder on 17/11/25.
//

import SwiftUI

struct MyTextStruct {
    let name: String
}

extension Array {
    
//    func getItem(atIndex: Int) -> Element? {
//        for (index, element) in self.enumerated() {
//            if index == atIndex {
//                return element
//            }
//        }
//        return nil
//    }
    
//    subscript(atIndex: Int) -> Element? {
//        for (index, element) in self.enumerated() {
//            if index == atIndex {
//                return element
//            }
//        }
//        return nil
//    }
    
//    subscript(safe index: Int) -> Element? {
//           return indices.contains(index) ? self[index] : nil
//    }
}

extension Array where Element == String {
    
    subscript(value: String) -> Element? {
        self.first(where: { $0 == value })
    }
}


struct Address {
    let street: String
    let city: City
}

struct City {
    let name: String
    let state: String
}

struct Customer {
    let name: String
    let address: Address
    
    subscript(value: String) -> String? {
        switch value {
        case "name":
            return name
        case "address":
            return "\(address.street), \(address.city.name)"
        default:
//            fatalError("Invalid key")
            return nil
        }
    }
    
    subscript(value: Int) -> String? {
        switch value {
        case 0:
            return name
        case 1:
            return "\(address.street), \(address.city)"
        default:
            fatalError("Invalid key")
        }
    }
}


struct SubscriptsBootcamp: View {
    
    @State private var myArray: [String] = ["one", "two", "three"]
    @State private var selectedItem: String? = nil
    
    var body: some View {
        VStack {
            ForEach(myArray, id: \.self) { string in
                Text(string)
            }
            
            Text("SELECTED: \(selectedItem ?? "none")")
        }
        .onAppear {
//            selectedItem = myArray.getItem(atIndex: 2)
//            selectedItem = myArray[2]
            
//            let value = "two"
//            selectedItem = myArray.first(where: { $0 == value })
//            selectedItem = myArray["one"]
            
            let customer = Customer(
                name: "John",
                address: Address(
                    street: "Main Street",
                    city: City(name: "New York", state: "New York")
                )
            )
//            selectedItem = customer.name
//            selectedItem = customer[keyPath: \.name]
//            selectedItem = customer["address"]
            selectedItem = customer["address"]
        }
    }
}

#Preview {
    SubscriptsBootcamp()
}
