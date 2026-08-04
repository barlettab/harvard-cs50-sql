# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

The observations will likely be evenly distributed because of the Random Partitioning approach. In this approach, AquaByte randomly sends its observations to each boat, so an observation is equally likely to be sent to any boat.

However, there is a trade-off. If we choose this approach, we will not know which observations are stored on each boat. If the researcher wants to find a specific observation, perhaps one collected between midnight and 1 a.m., they would have to run the query on all of the boats. This can result in wasted time because we do not know exactly where the data is stored.

## Partitioning by Hour
The observations will likely not be evenly distributed because, in this approach —Partitioning by Hour — the distribution depends on how many observations are collected during a certain period. Therefore, Boat A could have more observations than another boat.

However, this approach has a different trade-off. If we know the time when an observation was collected, we only need to run the query on the boat associated with that time period. This makes it easier and faster to find a specific observation. On the other hand, a certain boat could become overloaded with too much data if many observations are collected during its assigned time period.

## Partitioning by Hash Value

The observations will likely be evenly distributed because, with Partitioning by Hash Value, each observation is equally likely to be assigned to any of the available boats, regardless of when it was collected. However, a query for a range of observations, such as all observations between midnight and 1am, would need to be run on all boats, while a query for a specific observation can use its hash value to determine which boat contains it.

So, in this case, we have a good distribution of data and an efficient search when we want to find a specific observation. However, if we want to search for a range of observations, it would not be as efficient because we would have to run the query on all of the boats.
