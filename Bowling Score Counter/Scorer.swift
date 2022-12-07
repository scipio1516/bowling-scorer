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
        var firstScore: Int
        var secondScore: Int
        var fillScore: Int
        var isSpare: Bool
        var isStrike: Bool
    }
    
    struct frameView: View {
        let frame: OneFrame
        var body: some View {
            VStack { Text("\(frame.firstScore)").font(.custom("AvenirNext-Bold", size: 18.0))
                    .preferredColorScheme(.dark)
                    .foregroundColor(.yellow)
                Text("\(frame.secondScore)").font(.custom("AvenirNext-Bold", size: 18.0))
                    .preferredColorScheme(.dark)
                    .foregroundColor(.yellow)
            }
            .foregroundColor(.gray)
            .padding(4)
            .border(.purple)
        }
    }
    
    @State private var scores: [OneFrame] = [OneFrame](repeating: OneFrame(firstScore: 0, secondScore: 0, fillScore: 0, isSpare: false, isStrike: false), count: 10)
    @State private var buttons = [0,1,2,3,4,5,6,7,8,9,10]
    @State private var currentFrame = 0
    @State private var currentTotal = 0
    @State private var currentRoll = 1
    var body: some View {
    
        VStack {
            Text("Total: \(currentTotal)")
                .font(.custom("AvenirNext-Bold", size: 25.0))
            HStack {
                //if I have time, make the 10 the same size as all the other ones
                //after the first roll, show less buttons for each pin that was knocked down
                ForEach(buttons, id: \.self) {button in if(button <= 10 - scores[currentFrame].firstScore) {
                    Button("\(button)") {
                        updateScore(number: button)
                    }.padding(6.969) // hi
                        .border(.white)
                    
                        .font(.custom("AvenirNext-Bold", size: 20.0))
                        .foregroundColor(Color(red:0.99, green: 0.1, blue:0.13))
                        .background(Color(red:0.60, green: 0.60, blue:0.93))
                }
                }
            }
            HStack {
                ForEach(0..<10) {
                    index in frameView(frame: scores[index])
                }
            }
            if(currentFrame == 9) {
                Text("FillRoll: \(scores[9].fillScore)")
            }
        }
    }
    
    func updateScore(number: Int) {
        currentTotal = calcTotal()
            if(currentRoll == 1) {
                scores[currentFrame].firstScore = number
                currentRoll += 1
                if(scores[currentFrame].firstScore == 10) {
                    scores[currentFrame].isStrike = true
                    if(currentFrame == 9) {
                        currentRoll += 1
                    } else{
                        currentRoll = 1
                        currentFrame += 1
                    }
                }
            } else if(currentRoll == 2) {
                scores[currentFrame].secondScore = number
                if(scores[currentFrame].firstScore + scores[currentFrame].secondScore == 10) {
                    scores[currentFrame].isSpare = true
                }
                if(currentFrame == 9) {
                    currentRoll += 1
                } else{
                    currentRoll = 1
                    currentFrame += 1
                }
                
            } else if(currentRoll == 3 && (scores[currentFrame].isStrike || scores[currentFrame].isSpare)) {
                scores[currentFrame].fillScore = number
                currentRoll += 1
            }
        
    }
    
    func calcTotal() ->Int {
        var tempTotal = 0
        
        
        return tempTotal
    }
}



struct Scorer_Previews: PreviewProvider {
    static var previews: some View {
        Scorer()
    }
}
