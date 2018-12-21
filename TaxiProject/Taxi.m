
#import "Taxi.h"

@implementation Taxi

-(id)initWithGas:(float)mileage{
    self = [super init];
    gas = mileage;
    return self;
}

-(void)setGas:(float)litres{
    gas = litres;
}

-(float)getGas{
    return gas;
}

-(void)setNetIncome:(double)income{
    netIncome = income;
}

-(double)getNetIcome{
    return netIncome;
}

-(void)setMiles:(float)mileage{
    miles = mileage;
}

-(float)getMiles{
    return miles;
}

-(void)calculateMiles{
    Trip *lastTrip = [[self getTrip]lastObject];
    miles = miles + pow([lastTrip getInitVelcocity],2*([[lastTrip getCustomer]getTripDuration]/60.0)) - (lastTrip.getInitVelocity*([[lastTrip getCustomer]getTripDuration]/60.0));
}

-(NSMutableArray *)getTrip{
        Trips = [[NSMutableArray alloc]init];
    return Trips;
}

-(bool)gasLow{
        if(gas == 0){
            printf("Warning, you will run out of gas during the trip\n");
            [self setNetIncome:[self getNetIcome] - 100];
            return false;
        }else{
            return true;
        }
    }

-(void)setTrip:(Trip*)customerTrip{
     [Trips addObject:customerTrip];
}

-(void)gasUp{
    double litres;
    printf("Please enter how much you wold like to refuel\n");
    scanf("%lf",&litres);
    float price = randomNumber(1.45, 1.15);
    printf("Your fare at this time is: %f per litre\n", price);
    if([self getNetIcome] < litres*price){
        printf("Not enough funds for this operation\n");
    }else{
        [self setGas:[self getGas] + litres];
        [self setNetIncome: [self getNetIcome] - litres*price];
    }
}

@end
