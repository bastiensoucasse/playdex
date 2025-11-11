//
//  GameView.swift
//  Playdex
//
//  Created by Bastien Soucasse on 11/11/25.
//

import IGDB_SWIFT_API
import SwiftUI

struct GameView: View {
    @State var game: Proto_Game

    var body: some View {
        NavigationStack {
            EmptyView()
                .navigationTitle(game.name)
        }
    }
}
