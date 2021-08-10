//
//  EggyClient.swift
//  eggy-ios
//

import Foundation
import UserNotifications

public class EggyClient {
    private static var sharedEggyClient: EggyClient?

    let config: EggyConfig
    let device: EggyDevice
    var pushToken: String?

    private var session: URLSession

    public static func start(config: EggyConfig, device: EggyDevice) {
        if sharedEggyClient != nil {
            NSLog("EggyClient.start() was called more than once")
            return
        }

        sharedEggyClient = EggyClient(config: config, device: device)
    }

    static func shared() -> EggyClient? {
        return sharedEggyClient
    }

    public static func registerWithDeviceApi(_ deviceToken: Data) {
        guard EggyClient.shared() != nil else { return }
        let client = EggyClient.shared()!

        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        client.pushToken = token

        var request = URLRequest(url: client.config.deviceUrl, timeoutInterval: client.config.connectionTimeout)
        request.setValue(client.config.apiToken, forHTTPHeaderField: Constants.authorizationHeader)

        // Serialize HTTP body data as JSON
        let body: [String: Any] = [
            "client_user_id": client.device.clientUserId as Any,
            "identifier_for_vendor": client.device.identifierForVendor as Any,
            "apns_device_token": client.pushToken as Any,
            "preferred_language": client.device.preferredLanguage as Any,
            "os_name": client.device.osName as Any,
            "os_version": client.device.osVersion as Any,
            "device_model": client.device.deviceModel as Any,
            "timezone_seconds_from_gmt": client.device.timezoneSecondsFromGmt as Any
        ]

        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )

        request.httpMethod = "POST"
        request.httpBody = bodyData
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")

        let dataTask = client.requestTask(with: request) { (data, response, error) in
            print(response as Any)
            if let error = error {
            } else if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print("could not deserialize json")
                }
            } else {
                // Handle unexpected error
            }
        }

        dataTask.resume()
    }

    @available(iOS 10.0, *)
    public static func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        guard EggyClient.shared() != nil else { return }
        let client = EggyClient.shared()!

        client.sendPushEvent(eventType: "push_notification_was_opened", userInfo: response.notification.request.content.userInfo as [AnyHashable: Any])
    }

    @available(iOS 10.0, *)
    public static func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        guard EggyClient.shared() != nil else { return }
        let client = EggyClient.shared()!

        client.sendPushEvent(eventType: "push_notification_was_received_foreground", userInfo: notification.request.content.userInfo as [AnyHashable: Any])
    }

    private func sendPushEvent(eventType: String, userInfo: [AnyHashable: Any]) {
        var request = URLRequest(url: self.config.eventsUrl)
        request.setValue(self.config.apiToken, forHTTPHeaderField: Constants.authorizationHeader)

        let organizationId = userInfo["organization_id"] as? Int
        let appId = userInfo["app_id"] as? Int
        let userId = userInfo["user_id"] as? Int64
        let communiqueId = userInfo["communique_id"] as? Int
        let pushNotificationId = userInfo["push_notification_id"] as? Int
        let body: [String: Any] = [
            "raw_events": [[
                "organization_id": organizationId as Any,
                "client_id": self.device.clientUserId as Any,
                "client_event_time": Int(Date().timeIntervalSince1970 * 1000),
                "eventMetadata": [
                    eventType: [
                        "app_id": appId as Any,
                        "communique_id": communiqueId as Any,
                        "user_id": userId as Any,
                        "push_notification_id": pushNotificationId as Any,
                        "device_token": self.pushToken as Any
                    ]
                ]
            ]]
        ]

        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )

        request.httpMethod = "POST"
        request.httpBody = bodyData
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")

        let dataTask = self.requestTask(with: request) { (data, response, error) in
            print(response as Any)
            if let error = error {
                print(error)
            } else if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print("could not deserialize json")
                }
            } else {
                // Handle unexpected error
            }
        }

        dataTask.resume()
    }

    private func requestTask(with: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let req = with
        return self.session.dataTask(with: req, completionHandler: completionHandler)
    }

    private init(config: EggyConfig, device: EggyDevice) {
        self.config = config
        self.device = device
        self.pushToken = nil
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }

    private struct Constants {
        static let authorizationHeader = "authorization"
    }
}
