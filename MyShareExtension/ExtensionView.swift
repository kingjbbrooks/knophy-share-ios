//
// Created by Michael Lustig on 10/23/20.
//

import Foundation
import SwiftUI

struct ExtensionView: View {
    let viewModel: AddContentViewModel


    var body: some View {
        VStack {
            Text(viewModel.urlString)
            Button("Close") {
                viewModel.submitAndClose()
            }
        }
    }
}
