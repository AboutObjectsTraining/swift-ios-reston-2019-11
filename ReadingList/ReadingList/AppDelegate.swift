// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
         return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

