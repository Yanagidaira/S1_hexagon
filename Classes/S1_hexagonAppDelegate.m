//
//  S1_hexagonAppDelegate.m
//  S1_hexagon
//
//  Created by 柳平 貢 on 10/12/17.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "S1_hexagonAppDelegate.h"

@implementation S1_hexagonAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	firstVCont = [[FirstViewController alloc] init];
	scecondVCont = [[ScecondViewController alloc ]init];
	thirdVCont = [[ThirdViewController alloc] init];
					
	[window addSubview:firstVCont.view];
	
	[firstVCont startTYU];
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}
-(void) drive1{
	[window addSubview:firstVCont.view];
}
-(void) drive2{
	[window addSubview:scecondVCont.view];
}
-(void) drive3{
	[window addSubview:thirdVCont.view];

}			

-(void) test{
	NSUserDefaults * userDef = [[NSUserDefaults alloc] init];
	//[userDef setValue:@"あたたた" forKey:@"俺の名前を言ってみろ"];//書き込み
	NSString * str = [userDef valueForKey:@"俺の名前を言ってみろ"];//読み出し
	NSLog(@"str1_%@",str);//確認
	
	[userDef removeObjectForKey:@"俺の名前を言ってみろ"];
	NSLog(@"str2_%@",str);//確認

}


@end
