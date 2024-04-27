//
//  main.swift
//  DispatchSemaphore
//
//  Created by Angelos Staboulis on 27/4/24.
//

import Foundation
let queue = DispatchQueue(label: "com.template.DispatchSemaphore", attributes: .concurrent)
let semaphore = DispatchSemaphore(value: 3)
for movie in 0..<15 {
    queue.async {
        _ = movie + 1
        semaphore.wait()
        print("Downloading movie", movie)
        sleep(2) 
        print("Downloaded movie", movie)
        semaphore.signal()
    }
    
}

RunLoop.current.run(mode: RunLoop.Mode.default,  before: Date(timeIntervalSinceNow: 15))
