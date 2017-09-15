//
//  ProductManagedObject+CoreDataProperties.h
//  
//
//  Created by CdxN on 2017/9/15.
//
//

#import "ProductManagedObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ProductManagedObject (CoreDataProperties)

+ (NSFetchRequest<ProductManagedObject *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *identifier;
@property (nullable, nonatomic, copy) NSString *price;

@end

NS_ASSUME_NONNULL_END
