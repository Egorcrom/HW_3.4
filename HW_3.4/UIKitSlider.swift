//
//  UIKitSlider.swift
//  HW_3.4
//
//  Created by Егор Кромин on 01.02.2022.
//

import SwiftUI

struct UIKitSlider: UIViewRepresentable {
    @Binding var target: Int
    @Binding var current: Double
    var score = 0
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueDidChanged),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(current)
        uiView.thumbTintColor = thumbColor()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(current: $current)
    }
    
    private func thumbColor() -> UIColor {
        let score = CGFloat(100 - abs(target - lround(current * 100)))/100
        return UIColor(red: 1,
                       green: 0,
                       blue: 0,
                       alpha: score)
    }

}

extension UIKitSlider {
    class Coordinator: NSObject {
        @Binding var current: Double
        
        init(current: Binding<Double>) {
            self._current = current
        }
        
        @objc func valueDidChanged(_ sender: UISlider) {
            current = Double(sender.value)
        }
    }
}

struct UIKitSlider_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSlider(target: .constant(70),
                    current: .constant(50))
    }
}
