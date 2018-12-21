#import <Foundation/Foundation.h>
#import "Taxi.h"
#import "MathEquations.h"
#import "Trip.h"

//William and Sahil helped me alot for this project. Thank you to them both for helping me learn!

int mainMenu(){
    int input;
    printf("1. Pick up a Customer \n");
    printf("2. Fill gas tank \n");
    printf("3. Check meter \n");
    printf("0. Exit \n");
    scanf("%d",&input);
    return input;
}
int taximeter(){
    int input;
    printf("1. Net Income \n");
    printf("2. Check gas level \n");
    printf("3. Check Mileage \n");
    printf("4. Total number of trips \n");
    printf("0. Exit \n");
    scanf("%d",&input);
    return input;
}

double dblFromUser(NSString *text){
    double userInput;
    printf("%s",[text UTF8String]);
    scanf("%lf",&userInput);
    return userInput;
}

void setTimesFromUser(NSString *text, Trip *time){
    int hour;
    int minute;
    bool validInput = false;
    do {
        @try {
            printf("%s", [text UTF8String]);
            scanf("%dh%d",&hour,&minute);
            [time setHour:hour];
            [time setMinute:minute];
            validInput = true;
        } @catch (NSException *exception) {
            printf("Invalid Input\n");
        } @finally {
        }
        [time setHour:hour];
    } while (!validInput);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        double currentGasLevel;
        printf("Hi, please enter your maximum Gas level\n");
        scanf("%lf", &currentGasLevel);
        Taxi *taxi = [[Taxi alloc]initWithGas:currentGasLevel];
        
        bool exit = true;
        
        do {
            int option = mainMenu();
            switch (option) {
                case 1:{
                    Trip* beg = [[Trip alloc]init];
                    Trip* end = [[Trip alloc]init];
                    
                    Trip *newCustomer = [[Trip alloc]init];
                    
                    do {
            
                        setTimesFromUser(@"Please enter start time\n", beg);
                        setTimesFromUser(@"Please enter end time\n", end);
                    
                        [newCustomer setBegTime:beg];
                        [newCustomer setEndTime:end];
      
                        [newCustomer setTripDuration:[newCustomer CalculateTrip:[newCustomer getBegTime] end:[newCustomer getEndTime]]];
 
                        if([newCustomer tripInvalid]){
                            printf("Invalid duration, the trip cannot exceed 12 hours\n");
                        }
                    } while ([newCustomer tripInvalid]);
                    
                
                    Trip *newTrip = [[Trip alloc]initWithCustomer:newCustomer];
                    
                    double velo = dblFromUser(@"Enter the initial speed(km/h) of the trip\n");

                    [newTrip setInitVelocity:velo];

                    [taxi setTrip:newTrip];
        
                    [taxi gasUp];
                    
                    // check fuel to see if it can complete it
                    if([taxi gasLow]){
                        [newTrip setCost];
                        //calculate mileage and add it to the total mileage
                        [taxi calculateMiles];
                        [taxi setNetIncome:[taxi getNetIcome] + [newTrip getCost]];
                    }else{
                        [taxi gasLow];
                        [[taxi getTrip] removeLastObject];
                    }
                }
                    break;
                case 2:{
                    [taxi gasUp];
                }
                    break;
                case 3:{
                    bool taxMeter = true;
                    printf("Taximeter functions\n");
                    do {
                        printf("Choose one of the following options\n");
                        int option = taximeter();
                        switch (option) {
                            case 1:
                                printf("Your net income is: %lf \n", [taxi getNetIcome]);
                                break;
                            case 2:
                                printf("Your fuel level is: %lf \n", [taxi getGas]);
                                break;
                            case 3:
                                printf("Your total mileage is: %lf \n", [taxi getMiles]);
                                break;
                            case 4:
                                printf("The number of trip is: %lu \n", [[taxi getTrip]count]);
                                break;
                            case 0:
                                taxMeter = false;
                                break;
                            default:
                                printf("Option not available \n");
                                break;
                        }
                    } while(taxMeter);
                }
                    break;
                    
                case 0:{
                    exit = false;
                }
                    break;
                default:
                    printf("Option not available");
                    break;
            }// end of switch
        } while (exit);
        printf("Exit app");
        
    }
    return 0;
}
