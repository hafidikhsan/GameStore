//
//  HomeBackgroundView.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 13/08/22.
//

import SwiftUI

struct HomeBackgroundView: View {
    var body: some View {
        ZStack {
            Color.blue
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .position(x: 380, y: 50)
            Circle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .position(x: 0, y: 300)
        }
        .frame(height: 300)
    }
}

struct HomeBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBackgroundView()
    }
}
