//
//  ViewController.m
//  SampleParallaxScrolling
//
//  Created by Zeenath on 26/11/17.
//  Copyright © 2017 Zeenath. All rights reserved.
//

#import "ViewController.h"
#import "RKSwipeBetweenViewControllers.h"
#import "AddViewController.h"

@interface ViewController ()<UIScrollViewDelegate,UITableViewDelegate>
{
    CGFloat yPos;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.hidden = NO;
    UIPageViewController *pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    RKSwipeBetweenViewControllers *navigationController = [[RKSwipeBetweenViewControllers alloc]initWithRootViewController:pageController];
    
    
    
   // AddViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"AddViewController"];;
     UIViewController *vc1 = [[UIViewController alloc]init];
    AddViewController *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"AddViewController"];;
     UIViewController *vc3 = [[UIViewController alloc]init];
    
    
    [navigationController.viewControllerArray addObjectsFromArray:@[vc1,vc2,vc3]];
    [self addChildViewController:navigationController];
    [navigationController didMoveToParentViewController:self];
    [navigationController.view setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.myScrollView addSubview:navigationController.view];
    self.navigationController.navigationBar.hidden = NO;
   // [self addChildViewController:avcontroller];
   // [self.view addSubview:avcontroller.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.myScrollView setContentInset:UIEdgeInsetsMake(self.topView.bounds.size.height, 0.f, 0.f, 0.f)];
    [self.myScrollView scrollRectToVisible:CGRectMake(0, 10, 1, 1) animated:NO];
    
    float headerImageYOffset = 180 + self.topView.bounds.size.height - self.view.bounds.size.height;
    CGRect headerImageFrame = _topView.frame;
    headerImageFrame.origin.y = headerImageYOffset;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat scrollOffset = -scrollView.contentOffset.y;
    yPos = scrollOffset -_topView.bounds.size.height;
    _topView.frame = CGRectMake(0, yPos-10, _topView.frame.size.width, _topView.frame.size.height);
    float alpha=1.0-(-yPos/ _topView.frame.size.height);
    _topView.alpha=alpha;
   
}
@end
