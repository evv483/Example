//
//  VibroNotifications.swift
//  SpacegameReloaded
//
//  Created by Владимир Ефимов on 08.11.2021.
//  Copyright © 2021 Training. All rights reserved.
//

import Foundation
import UIKit

func vibro01() {
    Timer.scheduledTimer(withTimeInterval: 0, repeats: false) { (_) in  UINotificationFeedbackGenerator().notificationOccurred(.success)
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (_) in  UINotificationFeedbackGenerator().notificationOccurred(.success)
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (_) in  UINotificationFeedbackGenerator().notificationOccurred(.success)}}}
}
