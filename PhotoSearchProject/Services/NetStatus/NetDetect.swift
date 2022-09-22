//
//  NetDetect.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 08.09.2022.
//

import Foundation

@available(iOS 12.0, *)

public class NetDetect {
    public init() {
        NetStatus.shared.startMonitoring()
//        NetStatus.shared.netStatusChangeHandler = {
//            DispatchQueue.main.async { [unowned self] in
//                print("Change Net")
//            }
//        }
    }
}
