//
//  UIView_cocos2dAppDelegate.h
//  UIView+cocos2d
//
//  Created by joey on 12-3-13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIView_cocos2dViewController;

@interface UIView_cocos2dAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UIView_cocos2dViewController *viewController;

@end
