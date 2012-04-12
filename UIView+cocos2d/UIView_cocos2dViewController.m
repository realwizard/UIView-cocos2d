//
//  UIView_cocos2dViewController.m
//  UIView+cocos2d
//
//  Created by joey on 12-3-13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIView_cocos2dViewController.h"
#import "cocos2d.h"
#import "HelloWorldLayer.h"

@implementation UIView_cocos2dViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0,320  , 480)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.gotoadd.com"]]];
    [self.view addSubview:webView];
    
    //now begin cocos2d
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if( ! [CCDirector setDirectorType:kCCDirectorTypeDisplayLink] )
		[CCDirector setDirectorType:kCCDirectorTypeDefault];
	
	CCDirector *director = [CCDirector sharedDirector];
    
    glView = [EAGLView viewWithFrame:[window bounds]
								   pixelFormat:kEAGLColorFormatRGBA8	// kEAGLColorFormatRGBA8
								   depthFormat:0						// GL_DEPTH_COMPONENT16_OES
						];
	
	// attach the openglView to the director
	[director setOpenGLView:glView];
    
    [director setDeviceOrientation:kCCDeviceOrientationPortrait];
	
	[director setAnimationInterval:1.0/60];
	[director setDisplayFPS:NO];
    //设置为透明背景
    glView.opaque = NO;
    glView.backgroundColor = [UIColor clearColor];

    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    //加入glView
    [self.view addSubview:glView];
    [[CCDirector sharedDirector] runWithScene: [HelloWorldLayer scene]];
    
    [self performSelector:@selector(removeEaglView) withObject:self afterDelay:5];

}

-(void) removeEaglView
{
    [[CCDirector sharedDirector] pause];
    [glView removeFromSuperview];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
