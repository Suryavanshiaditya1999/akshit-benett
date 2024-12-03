# Apache Kafka MirrorMaker

Iska istemal ek Kafka cluster se doosre Kafka cluster tak messages ko replicate karna hota hai . MirrorMaker disaster recovery ya data aggregation scenarios ke liye useful hai, jahan same data ko multiple locations mein store aur use kiya jata hai. 

Matlab ki primary cluster ka jo consumer hai usse ye message read krega aur secondary cluster jo iska destination vha k producer k through ye data ko dusre cluster m send kr dega

![image](https://github.com/user-attachments/assets/572bc62c-eaf0-47d0-9742-5e0cfc8b9c01)


## Key Features of MirrorMaker

### How It Works
- MirrorMaker uses consumers to read data from the primary cluster and a producer to write data to the secondary cluster.

### MirrorMaker 2.0
- The second major release of MirrorMaker, MirrorMaker 2.0, is more complete than the first version. 
- It dynamically detects changes to topics and ensures source and target topic properties are synchronized.

### MirrorSourceConnector and MirrorSinkConnector
- **MirrorSourceConnector**: Replicates topics, topic ACLs, and configs of a single source cluster.
- **MirrorSinkConnector**: Consumes from the primary cluster and replicates topics to a single target cluster.

### Configuration
- MirrorMaker uses the Kafka Connect framework to simplify configuration and scaling.

## Best Practices
- For topic migration, an allow-list approach is recommended.
- For consumer groups, a deny-list approach can be used.
