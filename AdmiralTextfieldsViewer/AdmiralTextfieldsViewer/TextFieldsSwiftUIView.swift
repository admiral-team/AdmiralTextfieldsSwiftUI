//
//  TextFieldsSwiftUIView.swift
//  AdmiralTextfieldsViewer
//
//  Created by ADyatkov on 17.10.2023.
//

import SwiftUI
import AdmiralTheme

@available(iOS 14.0.0, *)
struct TextFieldsSwiftUIView: View {

    public var body: some View {
        NavigationView {
            List {
                ForEach(TextFieldsSwiftUIItem.allCases, id: \.id) { item in
                    NavigationLink(destination: view(for: item)) {
                        HStack(alignment: .center) {
                            Text(item.title)
                                .font(.headline)
                            Spacer()
                        }
                    }
                }
            }
        }
        .navigationTitle("Список элементов")
    }

    @ViewBuilder
    func view(for type: TextFieldsSwiftUIItem) -> some View {
        switch type {
        case .standard:
            StandardTextFieldSwiftUIView()
        case .double:
            DoubleTextFieldSwiftUIView()
        case .slider:
            InputRangeTextFieldSwiftUIView()
        case .cardNumber:
            BankTextFieldSwiftUIView()
        case .smsCode:
            OTPTextFieldSwiftUIView()
        case .number:
            InputNumbersSwiftUIView()
        case .feedback:
            FeedbackInputSwiftUIView()
        case .pincode:
            PinCodeTextFieldView()

        }
    }

}
