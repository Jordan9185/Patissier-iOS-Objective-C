//
//  ProductManagedObject+CoreDataProperties.m
//  
//
//  Created by CdxN on 2017/9/15.
//
//

#import "ProductManagedObject+CoreDataProperties.h"

@implementation ProductManagedObject (CoreDataProperties)

+ (NSFetchRequest<ProductManagedObject *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Product"];
}

@dynamic name;
@dynamic identifier;
@dynamic price;

@end
