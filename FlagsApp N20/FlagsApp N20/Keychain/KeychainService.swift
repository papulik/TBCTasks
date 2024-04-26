//
//  KeychainService.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 26.04.24.
//

import Foundation
import Security

class KeychainService {
    static let serviceName = "com.papuashvilizuka.FlagsApp-N20" // Change this to your app's bundle identifier

    static func save(_ value: String, forKey key: String) -> Bool {
        if let data = value.data(using: .utf8) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: serviceName,
                kSecAttrAccount as String: key,
                kSecValueData as String: data
            ]

            // Delete any existing item
            SecItemDelete(query as CFDictionary)
            // Save new item
            let status = SecItemAdd(query as CFDictionary, nil)

            return status == errSecSuccess
        }

        return false
    }

    static func retrieve(forKey key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        if status == errSecSuccess, let data = item as? Data {
            return String(data: data, encoding: .utf8)
        }

        return nil
    }

    static func delete(forKey key: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecAttrAccount as String: key
        ]

        let status = SecItemDelete(query as CFDictionary)

        return status == errSecSuccess
    }
}

