//
//  ContentView.swift
//  AOC_Day1
//
//  Created by Robin Phillips on 01/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("number of increases: \(countIncreases(readings: rollingTotals(readings: loadFile(fileName: "input") ?? [] )))")
    }
    
    
    func rollingTotals(readings: [Int]) -> [Int] {
        var rollingTotals: [Int] = []
        for i in 0..<readings.count where i > 1 {
                rollingTotals.append( readings[i-2] + readings[i-1] + readings[i] )
        }
        return rollingTotals
    }
    
    
    func countIncreases(readings: [Int]) -> Int {
        var counter = 0
        for i in 0..<readings.count where i > 0 && readings[i] > readings[i-1] {
                counter += 1
        }
        return counter
    }
    
    
    func loadFile(fileName: String) -> [Int]? {
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: "txt"), let contents = try? String(contentsOfFile: filepath) else { return nil }
        
        let stringArray = contents.components(separatedBy: "\n")
        let returnArray = stringArray.compactMap(Int.init)

        return returnArray
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
