import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    guard let pluginRegistrar = self.registrar(forPlugin: "FLPlugin") else { return false }

    let factory = FLNativeViewFactory(messenger: pluginRegistrar.messenger())
    pluginRegistrar.register(
      factory,
      withId: "ProfileScreen")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
