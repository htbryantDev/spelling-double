//
//  ContentView.swift
//  SpellingDouble
//
//  Created by Harry Bryant on 13/08/2021.
//

import SwiftUI

struct ContentView: View {
    private let words: [Word] = [
        .init(title: "Giraffe", pronunciation: "Jerahff", example: "this is a Giraffe")
    ]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Animals")
                    .font(.system(size: 30, weight: .bold))
            }
            Spacer()
            HStack {
                Text("Round number")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
                
            }
            VStack(spacing: 50) {
                CardView(word: words.first!)
                ControlsView()
            }
        }
        .padding(.all)
        .background(Color(red: 240/255, green: 239/255, blue: 239/255, opacity: 1))
    }
}

struct Word {
    let title: String
    let pronunciation: String
    let example: String
}

struct ControlsView: View {
    var body: some View {
        HStack {
            Spacer()
            IconButton(icon: Icon.cross)
            Spacer()
            TextButton(title: "Skip")
            Spacer()
            IconButton(icon: Icon.check)
            Spacer()
        }
    }
}

enum Icon: String {
    case cross = "xmark"
    case check = "checkmark"
}

struct IconButton: View {
    private let icon: Icon
    
    init(icon: Icon) {
        self.icon = icon
    }
    
    var body: some View {
        Image(systemName: icon.rawValue)
            .font(.system(size: 48))
            .padding(.all, 24)
            .foregroundColor(Color.white)
            .background(Color.black)
            .cornerRadius(100)
    }
}

struct TextButton: View {
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(.system(size: 14))
            .frame(width: 63, height: 63, alignment: .center)
            .foregroundColor(Color.white)
            .background(Color(red: 155/255, green: 165/255, blue: 164/255, opacity: 1))
            .cornerRadius(100)
    }
}

struct CardView: View {
    private let word: Word
    
    init(word: Word) {
        self.word = word
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.16), radius: 6, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 3)
                
            Text(word.title)
                .font(.system(size: 55, weight: .bold))
            
            VStack(spacing: 24) {
                Spacer()
                Text(word.pronunciation)
                    .font(.system(size: 20))
                Text(word.example)
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
            }.padding(.all, 24)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
