//
//  EggyDevice.swift
//  eggy-ios
//

import Foundation

public struct EggyDevice {
    // Client-app defined string that uniquely identifies the user. If the client app does not define this, eggy will assign an identifier associated with the anonymous user on the backend.
    public var clientUserId: String?

    public var identifierForVendor: String?
    public var preferredLanguage: String?
    public var osName: String?
    public var osVersion: String?
    public var deviceModel: String?
    public var timezoneSecondsFromGmt: Int?
    
    public init(clientUserId: String?) {
        self.clientUserId = clientUserId
        self.identifierForVendor = UIDevice.current.identifierForVendor?.uuidString ?? ""
        self.preferredLanguage = Bundle.main.preferredLocalizations.first!
        self.osName = UIDevice.current.systemName
        self.osVersion = UIDevice.current.systemVersion
        self.deviceModel = UIDevice.current.model
        self.timezoneSecondsFromGmt = Calendar.current.timeZone.secondsFromGMT()
    }

    public init() {
        self.init(clientUserId: nil)
    }
}
