//
//  MainScene.h
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "Left.h"
#import "Right.h"

@interface MainScene : CCNode
{
    //Main Scene
    CCNode *_mainNode;
    CCPhysicsNode *_mainPhysics;
    
    //Main Character Body Parts
    CCSprite *_rArm;
    CCSprite *_lArm;
    CCSprite *_lLeg;
    CCSprite *_rLeg;
    CCSprite *_head;
    CCSprite *_belly;
    
    //Outside Bodies(i.e) enemies, obstacles
    CCSprite *_magicBall;
    
    //Background
    
    CCSprite *_bg;
    
    //Buttons
    Left *leftButton;
    Right *rightButton;

}



@end
