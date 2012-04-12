//
//  UIView_cocos2dViewController.h
//  UIView+cocos2d
//
//  Created by joey on 12-3-13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface UIView_cocos2dViewController : UIViewController
{
    UIWindow			*window;
    EAGLView *glView;
}

-(void) removeEaglView;
@end
