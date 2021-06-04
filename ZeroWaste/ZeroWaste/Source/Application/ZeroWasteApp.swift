//
//  ZeroWasteApp.swift
//  ZeroWaste
//
//  Created by Tim on 2021/04/18.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKStory
import KakaoSDKLink

@main
struct ZeroWasteApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            LoadingView()
                .onOpenURL(perform: { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                })
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("didFinishLaunchingWithOptions called!")
        
        KakaoSDKCommon.initSDK(appKey: "a6a65513c92414f5787febf31973bb91", loggingEnable: true)
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url, options: options)
        }
        
        if (StoryApi.isStoryPostUrl(url)) {
            //do something
            print("storyPostUrl: \(url.absoluteString))")
        }
        
        if (LinkApi.isKakaoLinkUrl(url)) {
            //do something
            print("linkUrl: \(url.absoluteString))")
        }
        return false
    }
}
