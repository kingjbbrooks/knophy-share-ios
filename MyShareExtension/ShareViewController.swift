//
//  ShareViewController.swift
//  MyShareExtension
//
//  Created by Michael Lustig on 10/23/20.
//

import UIKit
import Social
import SwiftUI
import MobileCoreServices

class ShareViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = UIHostingController(rootView: ExtensionView(viewModel: AddContentViewModel(extensionContext: self.extensionContext!)))





        self.addChild(vc)
        self.view.addSubview(vc.view)
        vc.didMove(toParent: self)

        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        vc.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        vc.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        vc.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        vc.view.backgroundColor = UIColor.systemPink

    }
}
