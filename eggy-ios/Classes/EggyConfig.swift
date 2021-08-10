//
//  EggyConfig.swift
//  eggy-ios
//

import Foundation

public struct EggyConfig {
    /// The default values set when a EggyConfig is initialized
    struct Defaults {
        /// The default URL for registering device attributes
        static let deviceUrl = URL(string: "https://useeggy.com/registration/device/ios")!
        /// The default URL for sending events
        static let eventsUrl = URL(string: "https://useeggy.com/events/send")!

        /// The default timeout interval for network requests in seconds
        static let connectionTimeout: TimeInterval = 10.0
    }

    /// The API token for your [eggy app](https://useeggy.com/apps).
    public var apiToken: String

    /// The URL for registering device attributes
    public var deviceUrl: URL = Defaults.deviceUrl
    /// The URL for sending events
    public var eventsUrl: URL = Defaults.eventsUrl

    /// The timeout interval for network requests in seconds. Defaults to 10 seconds.
    public var connectionTimeout: TimeInterval = Defaults.connectionTimeout

    public init(apiToken: String) {
        self.apiToken = apiToken
    }
}

extension EggyConfig: Equatable {
    /// Compares the settable properties in 2 EggyConfig structs
    public static func == (lhs: EggyConfig, rhs: EggyConfig) -> Bool {
        return lhs.apiToken == rhs.apiToken
            && lhs.deviceUrl == rhs.deviceUrl
            && lhs.eventsUrl == rhs.eventsUrl
            && lhs.connectionTimeout == rhs.connectionTimeout
    }
}
