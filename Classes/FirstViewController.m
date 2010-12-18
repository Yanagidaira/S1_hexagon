//
//  FirstViewController.m
//  S1_hexagon
//
//  Created by 柳平 貢 on 10/12/17.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "S1_hexagonAppDelegate.h"


#define PARAM_GRAVITY (0.98)
#define PARAM_MAX_POW (10)
#define PARAM_REDUCE_POW_RATE (0.5)

#define PARAM_FRAMERATE (0.1)

#define PARAM_REBOUND_POW (0.5)

#define PARAM_TOUCHED_TYU_SIZE (2.0)

#define PARAM_REDUCE_TYU_SIZE_POW (4.0)

#define PARAM_SHOCK_WIDTH_RATE (0.75)
#define PARAM_SHOCK_HEIGHT_RATE (0.95)



@implementation FirstViewController


- (void) startTYU 
{
	NSLog(@"startTYU");
	
	m_defaultTYUWidth = m_TYU.frame.size.width;
	m_defaultTYUHeight = m_TYU.frame.size.height;
	
	m_TYU_x = m_TYU.center.x - m_defaultTYUWidth/2;
	m_TYU_y = m_TYU.center.y - m_defaultTYUHeight/2;
	NSLog(@"動作確認2_%d", m_TYU_x);
	[self performSelector:@selector(updateTYU) withObject:nil afterDelay:PARAM_FRAMERATE];
}

- (void) updateTYU {
	
	m_TYU_width = m_TYU.frame.size.width;
	m_TYU_height = m_TYU.frame.size.height;
	//NSLog(@"ボールの大きさ_%d",m_TYU_height );
	
	
//	//重力
//	//m_verticalPow += PARAM_GRAVITY;
//	
//	
//	//下向きの力がデカかったら最大値で切る(空気抵抗?)
//	if (PARAM_MAX_POW < m_verticalPow) {
//		m_verticalPow = PARAM_MAX_POW;
//	}
//	
//	
//	
//	//下の限界
//	if (self.view.frame.size.height < m_TYU.frame.origin.y + m_TYU.frame.size.height) {
//		m_TYU_y = self.view.frame.size.height - m_TYU.frame.size.height;
//		//NSLog(@"下に限界");
//		//ぶつかったら力が減衰して反対側に。弾む。
//		m_verticalPow = -m_verticalPow * PARAM_REDUCE_POW_RATE;
//		
//		
//		
//		//地面にぶつかったら上下に弾む
//		m_TYU_height = m_TYU_height*PARAM_SHOCK_HEIGHT_RATE;
//	}
//	
//	
//	
//	//左右のはみ出し限界、TYUさんが左右どっちにより大きくはみ出しているかチェック
//	float insertDepth = 0;
//	
//	if (m_TYU.frame.origin.x < 0) {
//		insertDepth = m_TYU.frame.origin.x;//マイナスのはず
//	}
//	if (self.view.frame.size.width < m_TYU.frame.origin.x + m_TYU.frame.size.width)  {
//		
//		float rightDepth = m_TYU.frame.origin.x + m_TYU.frame.size.width - self.view.frame.size.width;//プラスのはず
//		
//		if (0 < rightDepth + insertDepth) {//右にはみ出しているTYUさんの部分のほうが、左にはみ出しているTYUさんのぶんより大きい
//			insertDepth = m_TYU.frame.origin.x + m_TYU.frame.size.width - self.view.frame.size.width;//プラスのはず
//		}
//	}
//	
//	//左により大きくはみ出している
//	if (insertDepth < 0) {
//		m_TYU_x = 0;
//		
//		//ぶつかったらそれまで持っていた力が減衰して反対側に。弾む。
//		m_horizontalPow = -m_horizontalPow * PARAM_REDUCE_POW_RATE;
//		
//		//リバウンド力を加える
//		m_horizontalPow -= insertDepth*PARAM_REBOUND_POW;
//	}
//	
//	//右により大きくはみ出している
//	if (0 < insertDepth) {
//		m_TYU_x = self.view.frame.size.width - m_TYU.frame.size.width;
//		
//		//ぶつかったらそれまで持っていた力が減衰して反対側に。弾む。
//		m_horizontalPow = -m_horizontalPow * PARAM_REDUCE_POW_RATE;
//		
//		//リバウンド力を加える
//		m_horizontalPow -= insertDepth*PARAM_REBOUND_POW;
//	}
//	
//	
//	//壁にぶつかっていたら左右に弾む
//	if (insertDepth != 0) {
//		m_TYU_width = m_TYU_width*PARAM_SHOCK_WIDTH_RATE;
//	}
//	//
//	//存在している力で移動
	m_TYU_x += m_horizontalPow;
	m_TYU_y += m_verticalPow;
	
	
	m_horizontalPow = m_TYU_left_x - m_TYU_touched_x;
	m_verticalPow = m_TYU_left_y - m_TYU_touched_y;
	
	
	
	//TYUさんのサイズを元に戻します (初期のサイズに収束するような式)
//	m_TYU_width = m_TYU_width + (m_defaultTYUWidth - m_TYU_width)/PARAM_REDUCE_TYU_SIZE_POW;
//	m_TYU_height = m_TYU_height + (m_defaultTYUHeight - m_TYU_height)/PARAM_REDUCE_TYU_SIZE_POW;
//	
	
	
	//begin~commitまでの間に書いた現象が、アニメーションとして描画されます
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:PARAM_FRAMERATE];
	[m_TYU setFrame:CGRectMake(m_TYU_x, m_TYU_y, m_TYU_width, m_TYU_height)];
	//NSLog(@"m_TYU_yは_%d" , m_TYU_y);
	[UIView commitAnimations];
	
	
	//PARAM_FRAMERATE秒後、もう一度このメソッドを実行します
	//[self performSelector:@selector(updateTYU) withObject:nil afterDelay:PARAM_FRAMERATE];
	
}

-(void) reseTYU{
	NSLog(@"reseTYU");
	m_TYU_x =m_defaultTYUWidth;
	m_TYU_y =m_defaultTYUHeight;
	
}


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

/**
 タッチが取得できます。
 */
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	for (UITouch * touch in touches) {
		clickPos = [touch locationInView:self];
		break;
	}
}

/**
 タッチの動きが取得できます。
 */
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	for (UITouch * touch in touches) {
		CGPoint pt = [touch locationInView:self];
		m_horizontalPow=pt.x - clickPos.x;
		m_verticalPow = pt.y - clickPos.y;
		
		break;
	}
	
}


/**
 タッチの離れた瞬間が取得できます。
 */
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	}





- (void) setTYUSize:(float)size {
	[m_TYU setFrame:CGRectMake(m_TYU.center.x-m_TYU.frame.size.width * size/2, 
							  m_TYU.center.y-m_TYU.frame.size.height * size/2, 
							  m_TYU.frame.size.width * size, 
							  m_TYU.frame.size.height * size)];
}



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


-(IBAction) goto2{
	S1_hexagonAppDelegate * app = [[UIApplication sharedApplication] delegate];
	[app drive2];
	
}
-(IBAction) goto3{
	S1_hexagonAppDelegate * app = [[UIApplication sharedApplication] delegate];
	[app drive3];

}

-(IBAction) trial{
	S1_hexagonAppDelegate * app = [[UIApplication sharedApplication] delegate];
	[app test];
}

-(IBAction) reset{
	[self reseTYU];
}


@end
