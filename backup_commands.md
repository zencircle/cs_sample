```
SNAPSHOT_NAME=sales2-snp1
CASSANDRA_KEYSPACES="sales2"
AWS_ACCESS_KEY_ID=XXX
AWS_SECRET_ACCESS_KEY=XXX
AWS_REGION=us-east-1
S3_BUCKET_NAME=XX


dcos cassandra --name=cassandra plan start backup-s3 \
    -p SNAPSHOT_NAME=$SNAPSHOT_NAME \
    -p "CASSANDRA_KEYSPACES=$CASSANDRA_KEYSPACES" \
    -p AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -p AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    -p AWS_REGION=$AWS_REGION \
    -p S3_BUCKET_NAME=$S3_BUCKET_NAME

watch dcos cassandra --name=cassandra plan status backup-s3  

dcos cassandra --name=cassandra plan start restore-s3 \
    -p SNAPSHOT_NAME=$SNAPSHOT_NAME \
    -p "CASSANDRA_KEYSPACES=$CASSANDRA_KEYSPACES" \
    -p AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -p AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    -p AWS_REGION=$AWS_REGION \
    -p S3_BUCKET_NAME=$S3_BUCKET_NAME

 watch dcos cassandra --name=cassandra plan status restore-s3  
```
