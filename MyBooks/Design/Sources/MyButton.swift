//
//  MyButton.swift
//  MyBooks
//
//  Created by hongssup on 2/18/24.
//

import SwiftUI

struct MyButton: View {
    private var title: String
    private var type: ButtonType
    private var action: () -> Void
    private var image: Image?
    private var imageAlignment: Alignment = .leading
    
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    init(title: String, type: ButtonType = .filled, action: @escaping () -> Void) {
        self.title = title
        self.type = type
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack(spacing: 4) {
                if let image, imageAlignment == .leading {
                    image
                }
                Text(title)
                if let image, imageAlignment == .trailing {
                    image
                }
            }
            .frame(maxWidth: .infinity, minHeight: 44)
            .font(.system(size: 16, weight: .medium))
        })
        .buttonStyle(MyButtonStyle(type: type, isEnabled: isEnabled))
    }
    
    func setImage(_ image: Image?, alignment: Alignment = .leading) -> some View {
        var button = self
        button.image = image
        button.imageAlignment = alignment
        
        return button
    }
}

struct MyButtonStyle: ButtonStyle {
    private var type: ButtonType
    private var isEnabled: Bool
    
    init(type: ButtonType, isEnabled: Bool) {
        self.type = type
        self.isEnabled = isEnabled
    }
    
    func makeBody(configuration: Configuration) -> some View {
        let backgroundColor = configuration.isPressed ? type.pressedBackgroundColor : type.backgroundColor
        let foregroundColor = isEnabled ? type.foregroundColor : type.disabledForegroundColor
        
        configuration.label
            .background(isEnabled ? backgroundColor : type.disabledBackgroundColor)
            .foregroundStyle(foregroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 1)
                    .stroke(foregroundColor, lineWidth: type == .outline ? 1 : 0)
            )
            .cornerRadius(12)
    }
}

struct ButtonTest: View {
    @State private var isDisabled = false
    
    var body: some View {
        VStack {
            MyButton(title: "확인") { }
                .disabled(isDisabled)
            MyButton(title: "확인", type: .outline) { }
                .disabled(isDisabled)
            MyButton(title: "비활성화") {
                isDisabled.toggle()
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ButtonTest()
}
