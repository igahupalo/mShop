//
//  DatabaseConfig.swift
//  mShop
//
//  Created by Iga Hupalo on 02/05/2022.
//

import RealmSwift

public class DatabaseConfig {
    public static var config: Realm.Configuration = Realm.Configuration.defaultConfiguration

    public static var time1: Int64 = 0
    public static var time2: Int64 = 0
    public static var time3: Int64 = 0
    public static var time4: Int64 = 0
    public static var time5: Int64 = 0
    public static var time6: Int64 = 0

}


extension Date {
    var millisecondsSince1970: Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
