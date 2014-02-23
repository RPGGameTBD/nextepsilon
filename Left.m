//
//  Left.m
//  NextEpsilon
//
//  Created by Erik Artymiuk on 2/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Left.h"

@implementation Left

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    bg.physicsBody.velocity = CGPointMake(500, 0);
    magicBall.physicsBody.velocity = CGPointMake(500 + magicBall.physicsBody.velocity.x,
                                                 magicBall.physicsBody.velocity.y);
    
    for (int i = 0; i < [mainPhysicsNode.children count]; i++)
    {
        CCSprite* childNode = ((CCSprite*)[mainPhysicsNode.children objectAtIndex:i]);
        CGPoint currVelocity = childNode.physicsBody.velocity;
        childNode.physicsBody.velocity = CGPointMake(500 + currVelocity.x, currVelocity.y);
    }
    rLeg.rotation = -30;
    lLeg.rotation = -30;
    NSLog(@"LeftBegin");
}
-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    bg.physicsBody.velocity = CGPointMake(0, 0);
    magicBall.physicsBody.velocity = CGPointMake(-50, 0);
    
    for (int i = 0; i < [mainPhysicsNode.children count]; i++)
    {
        CCSprite* childNode = ((CCSprite*)[mainPhysicsNode.children objectAtIndex:i]);
        childNode.physicsBody.velocity = CGPointMake(0, 0);
    }
    
    rLeg.rotation = 0;
    lLeg.rotation = 0;
    NSLog(@"LeftEnded");
}

- (void)touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    NSLog(@"Left  Touch Cancelled");
}

- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    NSLog(@"Left Touch Moved");
}


@end
