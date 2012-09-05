//
//  InstagramMenuTestViewController.m
//  InstagramMenu
//
//  Created by Sacchy on 12/09/02.
//  Copyright (c) 2012年 Sacchy. All rights reserved.
//

#import "InstagramMenuTestViewController.h"
#define TOOLBAR_Y 372
#define SCROLLVIEW_HEIGHT 64

@implementation InstagramMenuTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"InstagramMenu";
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"menu"];

    /* 表示したい画像を格納してください */
    NSArray *imageName = [NSArray arrayWithObjects:@"black.png",@"blue.png",@"green.png",@"orange.png",@"pink.png",@"red.png",@"yellow.png",@"black.png",@"blue.png",nil];

    sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, TOOLBAR_Y+10, 320, SCROLLVIEW_HEIGHT)];
    CGRect scrollViewFrame = sv.frame;
    CGSize scrollViewSize = scrollViewFrame.size;
    scrollViewFrame.origin.x -= SPACE_WIDTH/2;
    scrollViewFrame.size.width += SPACE_WIDTH;
    sv.frame = scrollViewFrame;
    sv.contentSize = CGSizeMake((scrollViewSize.width/PRINTCOUNT+SPACE_WIDTH)*[imageName count]+SPACE_WIDTH*2, scrollViewSize.height);
    sv.pagingEnabled = NO;
    sv.clipsToBounds = NO;
    sv.showsHorizontalScrollIndicator = NO;
    
    CGFloat x = SPACE_WIDTH;
    for (int i=0; i < [imageName count]; i++)
    {
        x += SPACE_WIDTH/2.0;
        
        UIImage* image = [UIImage imageNamed:[imageName objectAtIndex:i%[imageName count]]];
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.image = image;
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, scrollViewSize.width/PRINTCOUNT, scrollViewSize.height)];
        [btn setBackgroundImage:iconView.image forState:UIControlStateNormal];
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [[UIColor grayColor] CGColor];
        btn.layer.cornerRadius = 12;
        btn.clipsToBounds = true;
        btn.tag = i;
        [btn setBackgroundImage:iconView.image forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventTouchUpInside];
        [sv addSubview:btn];
        
        x += btn.frame.size.width;
        x += SPACE_WIDTH/2.0;
    }
    [self.view addSubview:sv];

    UIBarButtonItem *Menu = [[UIBarButtonItem alloc] initWithTitle:@"MENU"
                                                             style:UIBarButtonItemStyleBordered
                                                            target:self
                                                            action:@selector(menuCmd)];
    
    UIBarButtonItem *Adjustflex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                target:self
                                                                                action:nil];
    
    NSArray *Buttons = [NSArray arrayWithObjects:Adjustflex,Menu,nil];
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, TOOLBAR_Y, 320, 44)];
    toolbar.barStyle = UIBarStyleBlack;
    [toolbar setItems:Buttons];
    [self.view addSubview:toolbar];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)hoge:(UIButton *)sender
{
    NSLog(@"%d",sender.tag);
}

- (void)menuCmd
{
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"menu"])
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"menu"];
        [self menuOpen];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"menu"];
        [self menuClose];
    }
}

- (void)menuOpen
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    CGRect scrollViewFrame = sv.frame;
    scrollViewFrame.origin.y = TOOLBAR_Y-(SCROLLVIEW_HEIGHT+10);
    sv.frame = scrollViewFrame;
    [UIView commitAnimations];
}

- (void)menuClose
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    CGRect scrollViewFrame = sv.frame;
    scrollViewFrame.origin.y = TOOLBAR_Y+(SCROLLVIEW_HEIGHT+10);
    sv.frame = scrollViewFrame;
    [UIView commitAnimations];
}

@end
