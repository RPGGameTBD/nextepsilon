//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene
-(void)start:(id)sender
{
    //Assign All variables to their controllers
    
    //Background info
    leftButton->bg = _bg;
    rightButton->bg = _bg;
    
    //Person info
    leftButton->rLeg = _rLeg;
    rightButton->rLeg = _rLeg;
    leftButton->lLeg = _lLeg;
    rightButton->lLeg = _lLeg;
    rightButton->head = _head;
    rightButton->belly = _belly; 
    
    //Get the ball hoppin
    leftButton->magicBall = _magicBall;
    _magicBall.physicsBody.velocity = CGPointMake(-50, 100);
    
    //Enable Touch
    self.userInteractionEnabled = TRUE;
    
    //Give buttons access to main scene info
    leftButton->mainPhysicsNode = _mainPhysics;

    NSLog(@"Pressed");
}

- (void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CCSprite *toAdd = [[CCSprite alloc] initWithImageNamed:@"Stone.png"];
    [toAdd setPosition:[(UITouch *)[event.allTouches anyObject] locationInNode:self]];
    CCPhysicsBody *physicsBody = [CCPhysicsBody bodyWithCircleOfRadius:5 andCenter: CGPointMake(5, 5)];
    [toAdd setPhysicsBody:physicsBody];
    [toAdd.physicsBody setElasticity:0.8];
    [_mainPhysics addChild:toAdd];

    NSLog(@"Added");
}

@end
