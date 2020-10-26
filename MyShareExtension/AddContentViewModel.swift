//
//  AddContentViewModel.swift
//  MyShareExtension
//
//  Created by Michael Lustig on 10/24/20.
//

import Foundation
import SwiftUI
import MobileCoreServices

class AddContentViewModel: ObservableObject {
    @Published var urlString: String = ""
    let extensionContext: NSExtensionContext


    init(extensionContext: NSExtensionContext) {
        self.extensionContext = extensionContext

        extractUrl()
    }

    func submitAndClose() {
       self.extensionContext.completeRequest(returningItems: [], completionHandler:nil)
    }

    private func extractUrl() {
        if let item = self.extensionContext.inputItems.first as? NSExtensionItem {
            if let itemProvider = item.attachments?.first {
                if itemProvider.hasItemConformingToTypeIdentifier(kUTTypeURL as String) {
                    itemProvider.loadItem(forTypeIdentifier: kUTTypeURL as String, options: nil, completionHandler: { (url, error) -> Void in
                        if let shareURL = url as? NSURL {
                            self.urlString = shareURL.absoluteString!
                        }
                    })
                }
            }
        }
    }
}

