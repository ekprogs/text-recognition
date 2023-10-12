Tasks: 
1. Time is of the essence, you have 1 hour.
2. You will have to deploy an Text Recognition algorithm to AWS Lambda. To break down the task:
    a. Research a suitable algorithm. Main points to consider:
        i.   The algorithm should be preferably in Python.
        ii.  The accuracy of the algorithm is not the main priority.
        iii. Storing the trained model in S3 could be a good idea. (If you have/find any)
    b. Prepare a Lambda handler function that accepts a base64 encoded image and returns the detected text as a string:
        i. The lambda handler should be able conduct any need of pre-processing on the image and predict the detected text.
    c. Deploy the Lambda function to AWS.
        i. Deploying the Lambda function to AWS via AWS SAM could be a good idea.
    d. Test the Lambda function using a base64 encoded image both locally and on production via Postman
3.  Any use of material is allowed (official documentations, medium articles, youtube videos etc)



Stop by 6:41pm