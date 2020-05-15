//
//  ContentView.swift
//  Shapes
//
//  Created by Steven Lipton on 5/11/20.
//  Copyright © 2020 Steven Lipton. All rights reserved.
//
// An exercise file for iOS Development Tips Weekly
// A weekly course on LinkedIn Learning for iOS developers
//  Season 11 (Q3 2020) video 06
//  by Steven Lipton (C)2020, All rights reserved
// Learn more at https://linkedin-learning.pxf.io/YxZgj
//This Week:  Learn how to use the basic shapes of SwiftUI 
//  For more code, go to http://bit.ly/AppPieGithub

import SwiftUI

struct ContentView:View {
    @State var index = 0
    var variedColor:Color{
        index % 2 == 0 ? .yellow : .clear
    }
    func aspectHeight(_ geometry:GeometryProxy)->CGFloat{
        geometry.size.width * (1.0 / 3.0)
    }
    
    var body: some View{
        GeometryReader{geometry in
            VStack{
                Text("Shapes demo")
                    .font(.largeTitle)
                Spacer()
                HStack{
                    Image(systemName:"\(self.index).square.fill")
                        .resizable()
                        .frame(width:geometry.size.width * 0.25 , height:geometry.size.width * 0.25)
                        .padding(.leading,geometry.size.width * 0.1)
                    Text(NumberFormatter.localizedString(from: NSNumber(integerLiteral: self.index), number: .spellOut).capitalized)
                        .font(.largeTitle)
                    Spacer()
                    }//HStack
                        .frame(width:geometry.size.width, height:self.aspectHeight(geometry))
                        .onTapGesture {
                            self.index = (self.index + 1) % 50
                        }//tap
                        .onLongPressGesture {
                            self.index = 0
                        }//longpress
                Spacer()
            }//Vstack
        }//Geometry
    }//body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
