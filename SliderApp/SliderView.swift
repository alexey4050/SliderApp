//
//  SliderUIKit.swift
//  SliderApp
//
//  Created by testing on 23.12.2023.
//
import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @Binding var value: Double
    @Binding var targetValue: Int
    let computeScore: () -> Int
    
    func makeUIView(context: Context) -> some UISlider {
        let slider = UISlider()
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        slider.minimumTrackTintColor = UIColor.red.withAlphaComponent(0.1)
        slider.maximumTrackTintColor = UIColor.red.withAlphaComponent(1.0)
        slider.minimumTrackTintColor = .blue
        slider.maximumTrackTintColor = .lightGray
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        let minValueLabel = UILabel()
        minValueLabel.text = "0"
        
        let maxValueLabel = UILabel()
        maxValueLabel.text = "100"
        
        minValueLabel.translatesAutoresizingMaskIntoConstraints = false
        maxValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        slider.addSubview(minValueLabel)
        slider.addSubview(maxValueLabel)
        
        NSLayoutConstraint.activate([
            minValueLabel.trailingAnchor.constraint(equalTo: slider.leadingAnchor, constant: -8),
            minValueLabel.centerYAnchor.constraint(equalTo: slider.centerYAnchor),
            maxValueLabel.leadingAnchor.constraint(equalTo: slider.trailingAnchor, constant: 8),
            maxValueLabel.centerYAnchor.constraint(equalTo: slider.centerYAnchor)
        ])
        return slider
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.value = Float(value)
        let score = computeScore()
        let alpha = CGFloat(score) / 100
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(alpha)
        uiView.subviews.compactMap{ $0 as? UILabel }.forEach {
            $0.textColor = UIColor.black
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
