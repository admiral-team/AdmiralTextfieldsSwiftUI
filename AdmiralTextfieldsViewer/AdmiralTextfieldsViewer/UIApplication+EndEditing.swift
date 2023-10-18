//
//  UIApplication+EndEditing.swift
//  AdmiralTextfieldsViewer
//
//  Created by ADyatkov on 17.10.2023.
//

import SwiftUI

extension UIApplication {

    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

}
