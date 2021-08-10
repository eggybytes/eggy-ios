//
//  ObjcEggyConfig.swift
//  eggy-ios
//

import Foundation

@objc(EggyConfig)
public final class ObjcEggyConfig: NSObject {
    var config: EggyConfig

    /// The API token for your [eggy app](https://useeggy.com/apps).
    @objc public var apiToken: String {
        get { config.apiToken }
        set { config.apiToken = newValue }
    }

    /// The URL for registering device attributes
    @objc public var deviceUrl: URL {
        get { config.deviceUrl }
        set { config.deviceUrl = newValue }
    }

    /// The URL for sending events
    @objc public var eventsUrl: URL {
        get { config.deviceUrl }
        set { config.deviceUrl = newValue }
    }

    /// The timeout interval for network requests in seconds. Defaults to 10 seconds.
    @objc public var connectionTimeout: TimeInterval {
        get { config.connectionTimeout }
        set { config.connectionTimeout = newValue }
    }

    @objc public init(apiToken: String) {
        config = EggyConfig(apiToken: apiToken)
    }

    /// Initializer to wrap the Swift EggyConfig into an ObjcEggyConfig
    init(_ config: EggyConfig) {
        self.config = config
    }

    /// Compares the settable properties in 2 EggyConfig structs
    @objc public func isEqual(object: Any?) -> Bool {
        guard let other = object as? ObjcEggyConfig
        else { return false }
        return config == other.config
    }
}
