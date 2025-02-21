//
//  FLNativeViewFactory.swift
//  Runner
//
//  Created by Amr Koritem on 21/02/2025.
//

import Flutter
import UIKit
import SwiftUI

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        if let arguments = args as? [String: Any],
           let name = arguments["name"] as? String,
           let email = arguments["email"] as? String,
           let imageName = arguments["imageName"] as? String {
            return FLNativeView(
                frame: frame,
                viewIdentifier: viewId,
                name: name,
                email: email,
                imageName: imageName,
                binaryMessenger: messenger)
        }
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            name: "",
            email: "",
            imageName: "",
            binaryMessenger: messenger)
    }

    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        name: String,
        email: String,
        imageName: String,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        // Create the SwiftUI view with the data passed from Flutter
        let swiftUIView = ProfileScreen(name: name, email: email, imageName: imageName)
        let hostingController = UIHostingController(rootView: swiftUIView)

        _view = hostingController.view
        _view.frame = frame

        super.init()
    }

    func view() -> UIView {
        return _view
    }
}
