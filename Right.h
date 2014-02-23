//
//  Right.h
//  NextEpsilon
//
//  Created by Erik Artymiuk on 2/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCButton.h"
@interface Right : CCButton
{
    //Background sprites
    @public CCSprite *bg;
    
    //Person Sprites
    @public CCSprite *rLeg;
    @public CCSprite *lLeg;
    @public CCSprite *head;
    @public CCSprite *belly;
    
    //Control Variables for movement tracking
    @public int countRight;
    @public int countLeft;
    @public CGPoint initialPosRight;
    @public CGPoint initialPosLeft;
    @public int countRightRotate;
    @public int countLeftRotate;
    @public int caseRight;
    @public int caseLeft;
}


@end
