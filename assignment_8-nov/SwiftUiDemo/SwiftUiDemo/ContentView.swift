//
//  ContentView.swift
//  SwiftUiDemo
//
//  Created by Mohammad Talha on 11/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return NavigationView{
                    List{
                        Section(header: Text("Adding some Elements to List")) {
                            NavigationLink(destination: ImageView()) {
                                Text("Image")
                            }
                            NavigationLink(destination: TextView()){
                                Text("Text")
                            }
                            NavigationLink(destination: VerticalStack()){
                                Text("Vertical Stack")
                            }
                            NavigationLink(destination: HorizontalStack()){
                                Text("Horizontal Stack")
                            }
                            NavigationLink(destination: PickerView()){
                                Text("Picker")
                            }
                        }
                    }.navigationBarTitle(Text("SwiftUI Assignment"))
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                                .previewDisplayName("iPhone 12")
                ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
                                .previewDisplayName("iPhone 13")
                ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                                .previewDisplayName("iPhone 8")
                ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus"))
                                .previewDisplayName("iPhone 8 Plus")
                ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                                .previewDisplayName("iPhone 11")
                ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                                .previewDisplayName("iPhone 11 Pro")
                ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                                .previewDisplayName("iPhone 11 Pro Max")
    }
}
