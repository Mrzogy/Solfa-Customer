//
//  CoustomTextFeld.swift
//  SolfaCoustomer
//
//  Created by 3bood on 01/12/1444 AH.
//

import Foundation
import SwiftUI
struct CoustomTextField: ViewModifier {
    var image : Image
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading,36)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 10,style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 10,style: .continuous)
                .stroke()
                .fill(.black.opacity(0.1))
                     
            )
            .overlay(
                image
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading,10)
                
            )
    }
}
extension View {
    func coustomTextField(image:Image = Image (systemName: "lock.fill")) -> some View {
        modifier(CoustomTextField(image: image))
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
struct RoundedCorner: Shape {
    var radiius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radiius, height: radiius))
        return Path(path.cgPath)
    }
}
extension View{
    func cornerRadius(_ radius : CGFloat, corners: UIRectCorner) -> some View{
        clipShape(RoundedCorner(radiius: radius, corners: corners))
    }
}
