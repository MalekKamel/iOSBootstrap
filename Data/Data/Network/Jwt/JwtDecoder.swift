//
// Created by Shaban on 18/07/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

// TODO
//import JWTDecode
//
//public struct JwtDecoder {
//    public static let shared = JwtDecoder()
//
//    public func decode(token: String) -> UserInfo {
//        let jwt = try! JWTDecode.decode(jwt: token)
//
//        let jsonData = try! JSONSerialization.data(withJSONObject: jwt.body, options: .prettyPrinted)
//        // here "jsonData" is the dictionary encoded in JSON data
//
//        let payload = try! JSONDecoder().decode(JwtPayload.self, from: jsonData)
//        let content = try! JSONDecoder().decode(UserInfo.self, from: payload.nameid.data(using: .utf8)!)
//
//        return content
//    }
//}
