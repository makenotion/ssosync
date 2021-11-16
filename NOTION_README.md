Get this repo to local:
```
git clone https://github.com/makenotion/ssosync.git
cd ssosync/
make go-build
```

Use SAM to deploy to Lambda:
```
export S3_BUCKET=notion-ssosync
make package // will package and upload the function to the bucket, and generate packaged.yaml
sam deploy --template-file packaged.yaml --stack-name ssosync --capabilities CAPABILITY_IAM 
```

