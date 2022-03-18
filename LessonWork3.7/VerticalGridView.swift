//
//  VerticalGridView.swift
//  LessonWork3.7
//
//  Created by Олейник Богдан on 18.03.2022.
//

import SwiftUI

struct VerticalGridView: View {
    
    let data = (1...100).map { "Item: \($0)" }
    let rows = [
        GridItem(.fixed(200))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

struct VerticalGridView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalGridView()
    }
}
