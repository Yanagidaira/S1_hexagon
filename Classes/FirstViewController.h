//
//  FirstViewController.h
//  S1_hexagon
//
//  Created by 柳平 貢 on 10/12/17.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface FirstViewController : UIViewController {
	IBOutlet UIImageView * m_TYU;
	
	//ライチュウのXとY位置
	float m_TYU_x;
	float m_TYU_y;
	
	
	//ライチュウにかかるパワー
	float m_horizontalPow;
	float m_verticalPow;
	
	
	//ライチュウの幅
	float m_TYU_width;
	float m_TYU_height;
	
	
	//ライチュウのもともとの大きさ
	float m_defaultTYUWidth;
	float m_defaultTYUHeight;

	//ライチュウをつかんだ位置
	float m_TYU_touched_x;
	float m_TYU_touched_y;
	
	//ライチュウを離した位置
	float m_TYU_left_x;
	float m_TYU_left_y;
	
	CGPoint clickPos;
}


//ライチュウのアニメーションを開始
- (void) startTYU;

//ライチュウの位置やサイズを更新
- (void) updateTYU;

//ライチュウのサイズが変わる
- (void) setTYUSize:(float)size;

//ライチュウの位置をリセット
-(void) reseTYU;



-(IBAction) goto2;
-(IBAction) goto3;
-(IBAction) trial;
-(IBAction) reset;

@end
