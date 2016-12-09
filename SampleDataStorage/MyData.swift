//
//  MyData.swift
//  SampleDataStorage
//
//  Created by mzgk on 2016/12/09.
//  Copyright © 2016年 mzgk. All rights reserved.
//

import Foundation

class MyData: NSObject, NSCoding {
    var valueString: String?

    override init() {

    }

    // シリアライズ（NSKeyedArchiver.archivedDataから呼び出される）
    func encode(with aCoder: NSCoder) {
        aCoder.encode(valueString, forKey: "valueString")
    }

    // デシリアライズ（NSKeyedUnarchiver.unarchiveObjectから呼び出される）
    required init?(coder aDecoder: NSCoder) {
        valueString = aDecoder.decodeObject(forKey: "valueString") as? String
    }
}
