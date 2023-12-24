//
//  Coordinator.swift
//  SliderApp
//
//  Created by testing on 23.12.2023.
//

import SwiftUI

final class Coordinator: NSObject {
    let parent: SliderView
    
    init(_ parent: SliderView) {
        self.parent = parent
    }
    
    @objc func valueChanged(_ sender: UISlider) {
        parent.value = Double(sender.value)
    }
}
