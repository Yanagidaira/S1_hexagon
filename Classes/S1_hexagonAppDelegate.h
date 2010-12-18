//
//  S1_hexagonAppDelegate.h
//  S1_hexagon
//
//  Created by 柳平 貢 on 10/12/17.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "ScecondViewController.h"
#import "ThirdViewController.h"


@interface S1_hexagonAppDelegate : NSObject <UIApplicationDelegate> {
   
	UIWindow *window;
	FirstViewController*firstVCont;
	ScecondViewController*scecondVCont;
	ThirdViewController*thirdVCont;
	
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

-(void) drive1;
-(void) drive2;
-(void) drive3;	

-(void) test;

@end

