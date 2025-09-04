# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

We should adapt the Random Partitioning depending on cases. We should use it when we observe the data and sees that it is quite evenly distributed. Secondly, the number of 'boats' should not be too much. This is because we have to search on all the boats everytime, so too many boats would be time-consuming.

## Partitioning by Hour

We should adapt the Hour Partitioning depending on cases. We should use it when we observe the data and sees that it usually can be categorized into groups based on frequency. When we can form groups like the Hour, we can search quicker, more focused. The downside is the boats can receive too much/too little requests so we should optimize in a way it is quite evenly distributed.

## Partitioning by Hash Value

We should adapt the Hash Partitioning depending on cases. We should use it when we observe the data and see that it usually needs quick lookups for specific values. When we can map directly from the key to the boat, we can search quicker, more focused. The downside is the range queries become inefficient and the data is scattered, so we should optimize in a way it balances query performance.
