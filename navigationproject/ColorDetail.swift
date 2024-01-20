//
//  ColorDetail.swift
//  navigationproject
//
//  Created by ahmad kaddoura on 1/19/24.
//

import SwiftUI

struct ColorDetail: View {
    var color : Color
    var body: some View {
        color.navigationTitle(color.description)
            .ignoresSafeArea()
    }
}

#Preview {
    ColorDetail(color: Color.mint)
}
