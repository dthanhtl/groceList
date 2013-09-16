//
//  HomeViewController.h
//  shaneList
//
//  Created by Thanh Tran on 9/10/13.
//  Copyright (c) 2013 Thanh Tran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate,UITableViewDataSource,UITableViewDelegate>
{


}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

-(void)checkUser;
@end
