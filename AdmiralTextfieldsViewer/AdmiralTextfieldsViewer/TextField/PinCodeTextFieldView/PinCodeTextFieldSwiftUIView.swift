//
//  PinCodeTextFieldView.swift
//  ExampleiOS
//
//  Created on 09.06.2021.
//

import SwiftUI
import AdmiralCore
import AdmiralTheme
import AdmiralTabsSwiftUI
import AdmiralTextfieldsSwiftUI

@available(iOS 14.0.0, *)
struct PinCodeTextFieldView: View {
    
    // MARK: - Private Properties
    
    @State private var leftButtonTitle: String = "Не могу войти"
    @State private var selectedNumber: String = ""
    @State private var controlsState: Int = 0
    @State private var maxCountNumbers: Double = 6
    @State private var status: CodeInputControl.Status = .normal
    @ObservedObject private var schemeProvider = AppThemeSchemeProvider<SwiftUIContentViewScheme>()
    
    public var body: some View {
        let scheme = schemeProvider.scheme
        let rightImage = selectedNumber.isEmpty ? AdmiralTextfieldsSwiftUI.SymbolAssets.Service.Outline.faceID.swiftUIImage : Assets.deleteButton.swiftUIImage
        NavigationView {
            ZStack {
                scheme.backgroundColor.swiftUIColor
                VStack {
                    HStack {
                        Spacer()
                    }
                    StandardTab(
                        items: ["Default", "Success", "Error"],
                        selection: $controlsState)
                    .onChange(of: controlsState, perform: { value in
                        self.status = CodeInputControl.Status(rawValue: value) ?? .normal
                    })
                    .padding(LayoutGrid.doubleModule)
                    Spacer()
                        .frame(height: LayoutGrid.doubleModule)
                    InputNumber(
                        titleText: .constant("Количество знаков"),
                        value: $maxCountNumbers,
                        minimumValue: .constant(1.0),
                        maximumValue: .constant(10.0))
                    .padding(LayoutGrid.doubleModule)
                    Spacer()
                    CodeInputControl(text: $selectedNumber, itemsCount: Int(maxCountNumbers), status: status)
                    Spacer(minLength: 100.0)
                    PinCodeKeyboard(
                        leftButtonTitle: leftButtonTitle,
                        rightButtonImage: rightImage,
                        didTapNumber: { number in
                            guard selectedNumber.count < Int(maxCountNumbers) else { return }
                            selectedNumber += String(number)
                        },
                        didTapLeftButton: {
                            print("Tap on left button")
                        },
                        didTapRightButton: {
                            guard !selectedNumber.isEmpty else { return }
                            if selectedNumber.count > Int(maxCountNumbers) {
                                for _ in Int(maxCountNumbers) ..< selectedNumber.count {
                                    selectedNumber.removeLast()
                                }
                            }
                            selectedNumber.removeLast()
                        })
                }
            }
        }
        .navigationTitle("Pincode")
    }

}

@available(iOS 14.0.0, *)
struct PinCodeTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PinCodeTextFieldView()
    }
}
