//
//  ObjcEggyDevice.swift
//  eggy-ios
//

import Foundation

@objc(EggyDevice)
public final class ObjcEggyDevice: NSObject {
    var device: EggyDevice

    /// Client-app defined string that uniquely identifies the user. If the client app does not define this, eggy will assign an identifier associated with the anonymous user on the backend.
    @objc public var clientUserId: String? {
        get { device.clientUserId }
        set { device.clientUserId = newValue }
    }

    @objc public var identifierForVendor: String? {
        get { device.identifierForVendor }
        set { device.identifierForVendor = newValue }
    }

    @objc public var preferredLanguage: String? {
        get { device.preferredLanguage }
        set { device.preferredLanguage = newValue }
    }

    @objc public var osName: String? {
        get { device.osName }
        set { device.osName = newValue }
    }

    @objc public var osVersion: String? {
        get { device.osVersion }
        set { device.osVersion = newValue }
    }

    @objc public var deviceModel: String? {
        get { device.deviceModel }
        set { device.deviceModel = newValue }
    }

    @objc public var timezoneSecondsFromGmt: Int {
        get { device.timezoneSecondsFromGmt ?? 0 }
        set { device.timezoneSecondsFromGmt = newValue }
    }

    @objc public init(clientUserId: String?) {
        device = EggyDevice(clientUserId: clientUserId)
    }

    @objc override public init() {
        device = EggyDevice()
    }

    /// Initializer to wrap the Swift EggyDevice into an ObjcEggyDevice
    init(_ device: EggyDevice) {
        self.device = device
    }
}
