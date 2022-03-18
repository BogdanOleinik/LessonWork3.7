//
//  ContentView.swift
//  LessonWork3.7
//
//  Created by Олейник Богдан on 18.03.2022.
//

import SwiftUI

struct CustonGridView<Content, T>: View where Content: View {
    
    let items: [T]
    let colums: Int
    let content: (T) -> Content
    var rows: Int {
        items.count / colums
    }
    
    var body: some View {
        GeometryReader { geometry in
            let sideLength = geometry.size.width / CGFloat(colums)
            ScrollView {
                VStack {
                    ForEach(0...rows, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<colums) { columnIndex in
                                if let index = indexFor(row: rowIndex, column: columnIndex) {
                                    content(items[index])
                                        .frame(width: sideLength, height: sideLength)
                                } else {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func indexFor(row: Int, column: Int) -> Int? {
        let index = row * colums + column
        return index < items.count ? index : nil
    }
}

struct CustonGridView_Previews: PreviewProvider {
    static var previews: some View {
        CustonGridView(items: [21, 2, 6, 13, 5, 6, 10], colums: 3) { item in
            Text("\(item)")
        }
    }
}
