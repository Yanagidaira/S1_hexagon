//
//  ThirdViewController.m
//  S1_hexagon
//
//  Created by 柳平 貢 on 10/12/17.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ThirdViewController.h"
#import "S1_hexagonAppDelegate.h"



@implementation ThirdViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}
-(IBAction) goto1{
	S1_hexagonAppDelegate * app = [[UIApplication sharedApplication] delegate];
	[app drive1];

}
-(IBAction) goto2{
	S1_hexagonAppDelegate * app = [[UIApplication sharedApplication] delegate];
	[app drive2];

}

@end
