//
//  ViewController.m
//  MCalculator
//
//  Created by Maria on 2018-09-28.
//  Copyright © 2018 Maria. All rights reserved.
//

#import "ViewController.h"
#include "math.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize firstNum,secondNum,tagNumValue,tagOpValue,answer,opValue,displayLabel,numberInput,isOperatorClicked;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setFirstNum: 0.0];
    [self setSecondNum: 0.0];
    [self setAnswer: 0.0];
    [self setOpValue: 100];
    [self setNumberInput: @""];
    [self setIsOperatorClicked: FALSE];
    [self setTagNumValue: 100];
    [self setTagOpValue: 0];
    
    [self printNumber];  //calling the method to initialize it
    
}

//setting the numberInput on the displaylabel
-(void)printNumber
{
    [displayLabel setText:numberInput];
}

//saving the first number when the operator is clicked
-(void)saveFirstNum
{
    firstNum = [numberInput doubleValue];
    numberInput = @"";
    [self printNumber];
}

//saving the second number after the operator is clicked(including =)
-(void)saveSecondNum
{
    secondNum = [numberInput doubleValue];
    numberInput =@"";
    [self printNumber];
}

//Reset the values
-(void)resetValues
{
    firstNum  = 0.0;
    secondNum = 0.0;
    answer    = 0.0;
    tagNumValue = 100;
    tagOpValue  = 100;
    opValue = 100;
    isOperatorClicked = FALSE;
    numberInput= @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

//eventhandlers for numbers pressed
-(IBAction)numberPressed:(id)sender
{
    tagNumValue = [sender tag];
    if (tagNumValue == 1)
    {
        numberInput = [numberInput stringByAppendingString:@"1"];
        [self printNumber]; //print it on the label
    }
    if (tagNumValue == 2)
    {
        numberInput = [numberInput stringByAppendingString:@"2"];
        [self printNumber]; //print it on the label
    }
    if (tagNumValue == 3)
    {
        numberInput = [numberInput stringByAppendingString:@"3"];
        [self printNumber]; //print it on the label
    }
    if (tagNumValue == 4)
    {
        numberInput = [numberInput stringByAppendingString:@"4"];
        [self printNumber]; //print it on the label
    }
    if (tagNumValue == 5)
    {
        numberInput = [numberInput stringByAppendingString:@"5"];
        [self printNumber]; //print it on the label
    }
    if (tagNumValue == 6)
    {
        numberInput = [numberInput stringByAppendingString:@"6"];
        [self printNumber]; //print it on the label
    }
    if (tagNumValue == 7)
    {
        numberInput = [numberInput stringByAppendingString:@"7"];
        [self printNumber]; //print it on the label
    }
    if (tagNumValue == 8)
    {
        numberInput = [numberInput stringByAppendingString:@"8"];
        [self printNumber]; //print it on the label
    }
    if (tagNumValue == 9)
    {
        numberInput = [numberInput stringByAppendingString:@"9"];
        [self printNumber]; //print it on the label
    }
    if (tagNumValue == 0)
    {
        numberInput = [numberInput stringByAppendingString:@"0"];
        [self printNumber]; //print it on the label
    }
    if (tagNumValue == 10)
    {
        numberInput = [numberInput stringByAppendingString:@"."];
        [self printNumber]; //print it on the label
    }
    
}


//eventhandlers for operators +,-,*,/,x^y
-(IBAction)setOperator:(id)sender
{
    tagOpValue = [sender tag];
    
    //when the first operator is clicked
    if (isOperatorClicked == FALSE)
    {
        //sets the opValue to the current button that was clicked
        if (tagOpValue==0)opValue = ADD;
        else if (tagOpValue==1)opValue = SUB;
        else if (tagOpValue==2)opValue = MULTIPLY;
        else if (tagOpValue==3)opValue = DIVIDE;
        else if (tagOpValue==19)opValue = POW;
        
        //saves the first Number that was put in before the operator was clicked
        [self saveFirstNum];
        isOperatorClicked = TRUE;
    }
    
    //Event handler when second operator is clicked for eg:12+5-1=..
    else if (isOperatorClicked == TRUE)
    {
        //12 gets saved
        [self saveSecondNum];
        
        //checks the previous operator first which is +
        if (opValue==ADD) firstNum= firstNum +secondNum;
        else if (opValue==SUB) firstNum= firstNum -secondNum;
        else if (opValue==MULTIPLY) firstNum= firstNum *secondNum;
        else if (opValue==DIVIDE) firstNum= firstNum /secondNum;
        else if (opValue==POW) firstNum = powf(firstNum, secondNum);
        
        //displays on the label and stores into a string
        numberInput = [NSString stringWithFormat:@"%f",firstNum];
        [self printNumber]; //print it on the label
        
        //updates the values of the opValue with -
        if (tagOpValue==0)opValue = ADD;
        else if (tagOpValue==1)opValue = SUB;
        else if (tagOpValue==2)opValue = MULTIPLY;
        else if (tagOpValue==3)opValue = DIVIDE;
        else if (tagOpValue==19)opValue = POW;

        //resets the values
        secondNum = 0;
        isOperatorClicked = TRUE;
    }

    [self setNumberInput:@""];
    
}

//additional functions
-(IBAction)additionalFunctions:(id)sender
{
    
    tagOpValue = [sender tag];
    
    if (firstNum == 0)
    {
        [self saveFirstNum];
        if (tagOpValue ==15) firstNum =1/firstNum;                                  //1/x function
        else if (tagOpValue ==16) firstNum = sqrt(firstNum);                        //squareroot function
        else if (tagOpValue ==17) firstNum = firstNum * firstNum;                   //square function
        else if (tagOpValue ==18) firstNum = firstNum * firstNum * firstNum;        //cube function
        else if (tagOpValue == 20) firstNum*=-1;                                    // +- function
        
        numberInput = [NSString stringWithFormat:@"%f",firstNum];
        [self printNumber]; //print it on the label
    }
    
    else if (secondNum == 0)
    {
        [self saveSecondNum];
        if (tagOpValue ==15) secondNum =1/secondNum;                                //1/x function
        else if (tagOpValue ==16) secondNum = sqrt(secondNum);                      //squareroot function
        else if (tagOpValue ==17) secondNum = secondNum * secondNum;                //square function
        else if (tagOpValue ==18) secondNum = secondNum * secondNum * secondNum;    //cube function
        else if (tagOpValue == 20) secondNum *= -1;                                 // +- function
        
        numberInput = [NSString stringWithFormat:@"%f",secondNum];
        [self printNumber]; //print it on the label
    }
    
}

//eventhandler for clear
-(IBAction)clearClicked:(id)sender
{
    [self resetValues];
    [self setNumberInput:@""];
    [self printNumber];
    [self setOpValue:0];
    [self setIsOperatorClicked:FALSE];
}

//eventhandler for delete
-(IBAction)deleteClicked:(id)sender
{
    if (firstNum==0)
    {
        [self saveFirstNum];
        firstNum = floor(firstNum/10);
        numberInput = [NSString stringWithFormat:@"%f",firstNum];
        
        if (firstNum==0) {
            [self resetValues];
            [self printNumber];
            [self setIsOperatorClicked:FALSE];
        }
        [self printNumber];
    }
    else
        if (firstNum!=0)
        {
            [self saveSecondNum];
            secondNum = floor(secondNum/10);
            numberInput = [NSString stringWithFormat:@"%f",secondNum];
         
            if (secondNum ==0) {
                [self setSecondNum:0];
            }
            [self printNumber];
        }
}

-(IBAction)equalPressed:(id)sender
{
    if (opValue == ADD) {
        [self saveSecondNum]; //MAYBE TAKE IT OUT AND PUT IT ABOVE
        answer = firstNum + secondNum;
    }
    
    else if (opValue == SUB) {
        [self saveSecondNum]; //MAYBE TAKE IT OUT AND PUT IT ABOVE
        answer = firstNum - secondNum;
    }
    
    else if (opValue == MULTIPLY) {
        [self saveSecondNum]; //MAYBE TAKE IT OUT AND PUT IT ABOVE
        answer = firstNum * secondNum;
    }
    
    else if (opValue == DIVIDE) {
        [self saveSecondNum]; //MAYBE TAKE IT OUT AND PUT IT ABOVE
        answer = firstNum / secondNum;
    }
    
    else if (opValue == POW) {
        [self saveSecondNum]; //MAYBE TAKE IT OUT AND PUT IT ABOVE
        answer = pow(firstNum, secondNum);
    }
    numberInput = [NSString stringWithFormat:@"%f",answer];
    [self printNumber]; //print it on the label
    [self resetValues];
}

@end
