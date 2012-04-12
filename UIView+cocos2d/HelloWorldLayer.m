//
//  HelloWorldLayer.m
//  CrazyCircus
//
//  Created by joey on 11-11-23.
//  Copyright __MyCompanyName__ 2011年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"


// HelloWorldLayer implementation
@implementation HelloWorldLayer



+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        CCSpriteBatchNode *mgr = [CCSpriteBatchNode batchNodeWithFile:@"flight.png" capacity:5];
		[self addChild:mgr z:0 tag:4];
		
		sprite = [CCSprite spriteWithBatchNode:mgr rect:CGRectMake(32 * 2,0,31,30)];
		[mgr addChild:sprite z:1 tag:5];
		
		sprite.scale = 2.0;
        CGSize s = [[CCDirector sharedDirector] winSize];
		sprite.position = ccp(s.width/2, 50);
        
        CGPoint p = ccp(s.width/2, 50);
        
        id ac0 = [sprite runAction:[CCPlace actionWithPosition:p]];
        id ac1 = [CCMoveTo actionWithDuration:2 position:ccp(s.width - 50, s.height - 50)];
        id ac2 = [CCJumpTo actionWithDuration:2 position:ccp(150, 50) height:30 jumps:5];
        id ac3 = [CCBlink actionWithDuration:2 blinks:3];
        id ac4 = [CCTintBy actionWithDuration:0.5 red:0 green:255 blue:255];
        
        
        [sprite runAction:[CCSequence actions:ac0, ac1, ac2, ac3, ac4, ac0, nil]];
        
    }
	return self;
}



// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    [self removeAllChildrenWithCleanup:YES];
	[super dealloc];
}
@end
