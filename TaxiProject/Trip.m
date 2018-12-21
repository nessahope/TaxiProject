
#import "Trip.h"


@implementation Trip

-(id)initWithCustomer:(int)ncustomer{
    self = [super init];
    customer = ncustomer;
    return self;
}
-(void)setCustomer:(int)ncustomer{
    customer = ncustomer;
}
-(int)getCustomer{
    return customer;
}
-(void)setCost{
    int start = [self getBegTime:getHour*60] + [self getBegTime:getMinute];
    for(int i = 0; i < [self getTripDuration] ; i++){
        
        if(start >= 0 && start < 480){
            cost = cost + 30.0/60.0;
        }
        if(start >= 480 && start < 840){
            cost = cost + 20.0/60.0;
        }
        if(start >= 840 && start < 1440){
            cost = cost + 25.0/60.0;
        }
        if(start == 1439){
            start=0;
        }else{
            start++;
        }
    }
}
-(double)getCost{
    return cost;
}

-(void)setHour:(int)input{
    hour = input;
}
-(int)getHour{
    return hour;
}
-(void)setMinute:(int)input{
    minute = input;
}
-(int)getMinute{
    return minute;
}
-(void)setBegTime:(int)time{
    begTime = time;
}
-(int)getBegTime{
    return begTime;
}
-(void)setEndTime:(int)time{
    endTime = time;
}
-(int)getEndTime{
    return endTime;
}
-(void)setTripDuration:(int)duration{
    tripDuration = duration;
}

-(int)getTripDuration{
    return tripDuration;
}
-(int)CalculateTrip:(int)begTime end:(int)endTime{
    double count = 0;
    double beginning = [begTime getHour]*60 + [begTime getMinute];
    double end = [endTime getHour ]*60 + [endTime getMinute];
    
    if(beginning < end){
        count = end - beginning;
    }else{
        count = (1440 - beginning) + end;
    }
    return count;
}

-(void)setInitVelocity:(double)velocity{
    initVelocity = velocity;
}
-(double)getInitVelcocity{
    return initVelocity;
}

-(bool)tripInvalid{
    if((double)tripDuration < 720){
        return false;
    }else{
        return true;
    }
}
@end
