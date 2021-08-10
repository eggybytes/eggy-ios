//
//  ObjcEggyClient.swift
//  eggy-ios
//

import Foundation

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

    @objc public static func registerWithDeviceApi(deviceToken: String) {
        return EggyClient.registerWithDeviceApi(deviceToken: deviceToken)
    }

    @objc public static func sendPushEvent(eventType: String, userInfo: [AnyHashable: Any]) {
        return EggyClient.sendPushEvent(eventType: eventType, userInfo: userInfo)
    }

    private init(client: EggyClient) {
        eggyClient = client
    }
}
