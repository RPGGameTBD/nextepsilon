//
//  Left.h
//  NextEpsilon
//
//  Created by Erik Artymiuk on 2/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCButton.h"

@interface Left : CCButton
{
    //Background Sprites
    @public CCSprite *bg;
    
    //Character Sprites
    @public CCSprite *rLeg;
    @public CCSprite *lLeg;
    
    //Outside body sprites
    @public CCSprite *magicBall;
    @public CCPhysicsNode *mainPhysicsNode;
    
}

@end
