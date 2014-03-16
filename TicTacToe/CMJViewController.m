//
//  CMJViewController.m
//  TicTacToe
//
//  Created by Claire Jencks on 3/13/14.
//  Copyright (c) 2014 Claire Jencks. All rights reserved.
//

#import "CMJViewController.h"

@interface CMJViewController ()

{
    IBOutlet UILabel *myLabelOne;
    IBOutlet UILabel *myLabelTwo;
    IBOutlet UILabel *myLabelThree;
    IBOutlet UILabel *myLabelFour;
    IBOutlet UILabel *myLabelFive;
    IBOutlet UILabel *myLabelSix;
    IBOutlet UILabel *myLabelSeven;
    IBOutlet UILabel *myLabelEight;
    IBOutlet UILabel *myLabelNine;
    
    BOOL player; //this is a steady state declaration
    
}

@property (strong, nonatomic) IBOutlet UILabel *whichPlayerLabel;

@end

@implementation CMJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    myLabelOne.text = @"Label 1";
    myLabelTwo.text = @"Label 2";
    myLabelThree.text = @"Label 3";
    myLabelFour.text = @"Label 4";
    myLabelFive.text = @"Label 5";
    myLabelSix.text = @"Label 6";
    myLabelSeven.text = @"Label 7";
    myLabelEight.text =@"Label 8";
    myLabelEight.text =@"Label 9";
    
    myLabelOne.textColor =[UIColor clearColor];
    myLabelTwo.textColor =[UIColor clearColor];
    myLabelThree.textColor =[UIColor clearColor];
    myLabelFour.textColor =[UIColor clearColor];
    myLabelFive.textColor =[UIColor clearColor];
    myLabelSix.textColor =[UIColor clearColor];
    myLabelSeven.textColor =[UIColor clearColor];
    myLabelEight.textColor =[UIColor clearColor];
    myLabelNine.textColor =[UIColor clearColor];

    self.whichPlayerLabel.text = @"It's your time to shine Player 1"; //initial setting of whichPlayerLabel
    self.whichPlayerLabel.backgroundColor = [UIColor blueColor];
    player = YES; //boolean steady state value
    
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer; {

 
    CGPoint point =[tapGestureRecognizer locationInView:self.view];
    UILabel *someLabel = [self findLabelUsingPoint:point];
    
        //right hand of above --self (in this case, the view controller) is calling the method findLabelUsingPoint. On the left - whatever label object is retrieved is placed in the someLabel object.

    
        //boolean linking ''player'' declared up at the interface (who's turn it is)
     //there are only two states, so if or else don't require boolean to be ==yes or no'
    if (player) {
   
        //this can be called without the self because it was declared within this current method (onLabelTapped) ((scope rule))
    someLabel.text = @"X";
    someLabel.textColor = [UIColor blueColor];
    self.whichPlayerLabel.text = @"It's your move Player 2";
    self.whichPlayerLabel.backgroundColor = [UIColor redColor];
    [self whoWon];
    

    }else {

    someLabel.text = @"O";
    someLabel.textColor = [UIColor redColor];
    self.whichPlayerLabel.text = @"It's your time to shine Player 1";
    self.whichPlayerLabel.backgroundColor = [UIColor blueColor];
    //BOOL player = YES;//the boolean again
    [self whoWon];}
    
    player = !player;
    

    
if ([self whoWon])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: nil
                                                        message: @"You Win!"
                                                       delegate: self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
                                    [alert show];
    }

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    NSLog(@"clickedButtonAtIndex");
    
    switch (buttonIndex)
    {
        case 0:
            NSLog(@"0");
            [self viewDidLoad];
            break;
        case 1:
            NSLog(@"1");
            break;
        default:
            break;
    }
    //    if(buttonIndex == 0)
//    {
//        [self viewDidLoad];
//    }
}


//get me back to clean slate (reset the game) create a method (then call it) viewDidLoad

-(void)reloadGame
{
    [self viewDidLoad];
}



//this method uses the CGRect struct (a touch gesture) to trigger, it is called within IBACtion onLabelTapped method
//all this method does it find your label, if you want it to be useful you need to do something further with it (connect or call it with another method)

-(UILabel *)findLabelUsingPoint:(CGPoint)point

{
    //CRRECTcontains point is a c function (a struct) that takes in 2 parameters, myLabel.frame and also point and once it searches it finds (returns) your UILabel ((the object)). in this case we're asking it to return myLabelOne or myLabelTwo etc.
    
    //NSLog(@"1"); - just a check
    //if winner activates then return ''winner''
    //if doesnt return nil
    //have the text of the activated label == to a string that you send back to your tapped method. then check it to display which player won.
    UILabel *nilLabel = nil; //this is a created label set to nil so end of 'if then' returns it
    
    if (CGRectContainsPoint(myLabelOne.frame, point)) {
        NSLog(@"1");
        return myLabelOne;
    }
    else if (CGRectContainsPoint(myLabelTwo.frame, point)) {
        return myLabelTwo;
        NSLog(@"2");
    }
    else if (CGRectContainsPoint(myLabelThree.frame, point)) {
        return myLabelThree;
        NSLog(@"3");
    }
    else if (CGRectContainsPoint(myLabelFour.frame, point)) {
        return myLabelFour;
        NSLog(@"4");
    }
    else if (CGRectContainsPoint(myLabelFive.frame, point)) {
        return myLabelFive;
        NSLog(@"5");
    }
    else if (CGRectContainsPoint(myLabelSix.frame, point)) {
        return myLabelSix;
        NSLog(@"6");
    }
    else if (CGRectContainsPoint(myLabelSeven.frame, point)) {
        return myLabelSeven;
        NSLog(@"7");
    }
    else if (CGRectContainsPoint(myLabelEight.frame, point)) {
        return myLabelEight;
        NSLog(@"8");
    }
    else if (CGRectContainsPoint(myLabelNine.frame, point)) {
        return myLabelNine;
        NSLog(@"9");
    }

    else
    {
        return nilLabel;
    }
}
//the whoWon method
-(BOOL)whoWon //method which returns a pointer to a nsstring object

{
    
    if
        ([myLabelOne.text isEqualToString:myLabelFour.text] && [myLabelFour.text isEqualToString:myLabelSeven.text]) {
        return YES; //the state of the boolean
        
        
        }
    else if
    
        ([myLabelTwo.text isEqualToString:myLabelFive.text] && [myLabelFive.text isEqualToString:myLabelEight.text]) {
        return YES;
        }
    else if
        
        ([myLabelThree.text isEqualToString:myLabelSix.text] && [myLabelSix.text isEqualToString:myLabelNine.text]) {
        return YES;
            
        }
    else if
        
        ([myLabelOne.text isEqualToString:myLabelTwo.text] && [myLabelTwo.text isEqualToString:myLabelThree.text]) {
        return YES;
            
        }
    else if
        
        ([myLabelFour.text isEqualToString:myLabelFive.text] && [myLabelFive.text isEqualToString:myLabelSix.text]) {
        return YES;
            
        }
    else if
        
        ([myLabelSeven.text isEqualToString:myLabelEight.text] && [myLabelEight.text isEqualToString:myLabelNine.text]) {
        return YES;
        
        }
    else if
        
        ([myLabelOne.text isEqualToString:myLabelFive.text] && [myLabelFive.text isEqualToString:myLabelNine.text]) {
        return YES;
        }
    else if
        
        ([myLabelThree.text isEqualToString:myLabelFive.text] && [myLabelFive.text isEqualToString:myLabelSeven.text]) {
         return YES;
            
        }
    else
        {
        return NO;
        }
}

@end

//what I want in here is to call a method that checks to see if that move has completed a three button combination (of which there are 8 possibilities)
//is it possible to set these 8 combinations equal to a boolean value - so if any of these come true, the boolean switches, which triggers a 'you won'
//[self whoWon]; //dots arent' used because this isn't refering to a @property, this called method is down at the bottom of the .m file
//set up a new nsstring object to store the result of this method so you can access it
