//
//  Scorer.swift
//  Bowling Score Counter
//
//  Created by Leo Lai on 11/30/22.
//

import SwiftUI

struct Scorer: View {
    struct OneFrame: Identifiable {
        
        let id = UUID()
        var firstRoll: Int
        var secondRoll: Int
        var fillRoll: Int
        var isSpare: Bool
        var isStrike: Bool
        var isLastFrame: Bool
    }
    private var scores: [OneFrame] = []
    var body: some View {
        
        HStack {
            ForEach(scores) {
                score in Text("\(score.firstRoll) / \(score.secondRoll)").font(.custom("AvenirNext-Bold", size: 13.0))
            }
        }
    }
    init() {
        for i in 1...10 {
            scores.append(OneFrame(firstRoll: 0, secondRoll: 0, fillRoll: 0, isSpare: false, isStrike: false, isLastFrame: false))
            if(i == 10) {
                scores[i - 1].isLastFrame = true
            }
        }
    }
}

struct Scorer_Previews: PreviewProvider {
    static var previews: some View {
        Scorer()
    }
}
