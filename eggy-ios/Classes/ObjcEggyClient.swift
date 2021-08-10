//
//  ObjcEggyClient.swift
//  eggy-ios
//

import Foundation
import UserNotifications

@objc(EggyClient)
public final class ObjcEggyClient: NSObject {
    private var eggyClient: EggyClient

    @objc public static func start(config: ObjcEggyConfig, device: ObjcEggyDevice) {
        EggyClient.start(config: config.config, device: device.device)
    }

    @objc public static func shared() -> ObjcEggyClient? {
        guard let client = EggyClient.shared() else { return nil }
        return ObjcEggyClient(client: client)
    }

    @objc public static func registerWithDeviceApi(deviceToken: Data) {
        return EggyClient.registerWithDeviceApi(deviceToken)
    }

    @available(iOS 10.0, *)
    @objc public static func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        return EggyClient.userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
    }

    @available(iOS 10.0, *)
    @objc public static func userNotificationCenter(_ center: UNUserNotificationCenter, willPresentNotification notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        return EggyClient.userNotificationCenter(center, willPresent: notification, withCompletionHandler: completionHandler)
    }

    private init(client: EggyClient) {
        eggyClient = client
    }
}
