//
//  ContentView.swift
//  AOC_Day1
//
//  Created by Robin Phillips on 01/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("number of increases: \(countIncreases(readings: loadFile(fileName: "input")))")
    }
    
    func countIncreases(readings: [Int]) -> Int {
        var counter = 0
        for i in 0..<readings.count {
            if i == 0 {
                continue
            } else {
                if readings[i] > readings[i-1] {
                    print(readings[i])
                    counter += 1
                }
            }
        }
        return counter
    }
    
    
    func loadFile(fileName: String) -> [Int] {
        if let filepath = Bundle.main.path(forResource: fileName, ofType: "txt") {
            do {
                var returnArray: [Int] = []
                
                let contents = try String(contentsOfFile: filepath)
                let stringArray = contents.components(separatedBy: "\n")
                
                for i in 0..<stringArray.count - 1 {
                    returnArray.append(Int(stringArray[i]) ?? 0 )
                }
                return returnArray
                
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        return [9999] // defaut return value if everything above fails
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
