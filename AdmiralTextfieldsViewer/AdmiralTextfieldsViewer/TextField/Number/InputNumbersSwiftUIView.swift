//
//  InputNumbersSwiftUIView.swift
//  ExampleiOS
//
//  Created by on 13.10.2022.
//  
//


import SwiftUI
import AdmiralTheme
import AdmiralTextfieldsSwiftUI

@available(iOS 14.0.0, *)
struct InputNumbersSwiftUIView: View {

    @State private var selection: Int?
    @ObservedObject private var schemeProvider = AppThemeSchemeProvider<SwiftUIContentViewScheme>()

    var body: some View {
        List {
            ForEach(InputNumbersSwiftUIItem.allCases, id: \.id) { item in
                NavigationLink(destination: view(for: item)) {
                    HStack(alignment: .center) {
                        Text(item.title)
                            .font(.headline)
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Number")
    }

    @ViewBuilder
    func view(for type: InputNumbersSwiftUIItem) -> some View {
        switch type {
        case .default:
            InputNumberDefaultSwiftUIView()
        case .secondary:
            InputNumberSecondarySwiftUIView()
        case .input:
            NumberSwiftUIView()
        }
    }

}

@available(iOS 14.0.0, *)
struct InputNumbersSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InputNumbersSwiftUIView()
    }
}
