//
//  ViewController.m
//  H211009SwipeRectangle
//
//  Created by houwei2021 on 2021/10/9.
//

#import "ViewController.h"
#import "H211009SwipeRectangle-Swift.h"

@interface ViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;

//@property (strong, nonatomic) RectView *rectView;

@property (strong, nonatomic) UIView *dragView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self addSubviews];
    [self addRecognizer];
}

- (void)addSubviews {
    
    self.dragView = [[UIView alloc] init];
    self.dragView.backgroundColor = [UIColor yellowColor];
    self.dragView.frame = CGRectMake(100, 100, 100, 100);
    self.dragView.layer.cornerRadius = 3;
    self.dragView.layer.masksToBounds = YES;
    [self.view addSubview:self.dragView];
}

- (void)addRecognizer {
    
//    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureRecognizerAction:)];
//    recognizer.direction = UISwipeGestureRecognizerDirectionDown;
//    [self.view addGestureRecognizer:recognizer];
    
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizerAction:)];
    [self.dragView addGestureRecognizer:recognizer];
}

- (void)panGestureRecognizerAction:(UIPanGestureRecognizer *)recognizer {
    
    if (recognizer.state == UIGestureRecognizerStateChanged) {
            CGPoint translation = [recognizer translationInView:self.dragView];
 
 
        self.dragView.center = CGPointMake(self.dragView.center.x + translation.x, self.dragView.center.y + translation.y);
        
            //关键:不设为零会不断递增，视图会突然不见
            [recognizer setTranslation:CGPointZero inView:self.view];
        }
}

//- (void)swipeGestureRecognizerAction:(UISwipeGestureRecognizer *)recognizer {
//
//    if (recognizer.state == UIGestureRecognizerStateBegan) {
//
//        CGPoint point = [recognizer locationInView:self.view];
//        NSLog(@"-->> 1 point:%@", NSStringFromCGPoint(point));
//
//    } else if(recognizer.state == UIGestureRecognizerStateEnded){
//        //起点坐标
//        CGPoint point = [recognizer locationInView:self.view];
//        NSLog(@"-->> start point:%@", NSStringFromCGPoint(point));
//    }
//}

@end
