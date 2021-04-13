# word-count-beam


[WordCountWithCounters](src/main/java/org/apache/beam/examples/WordCountWithCounters.java) writes 
 the pipeline metrics after job execution into a newly created GCS Bucket.
 This is a test for running code after the job graph using `result.waitUntilFinish()`


Export the below variables and run the script
```
  export PROJECT=<gcp project>
  export REGION=<gcp region>>
  export TEMP_GCS=<gs://bucket/dir>
  export OUTPUT_GCS=<gs://bucket/dir>
  export METRICS_BUCKET=<bucket to be created without gs:// prefix>

  ./run-WordCountWithCounters
```

Please note that this approach might not be supported while using Dataflow templates:

Template wouldn't work well with "waitUntilFinish()". Because templates are preloaded into Dataflow backend and Dataflow will not generate new graphs everytime the pipeline runs. The benefits of templates are that their start up time is shorter to perform generic operations (such as loading from GCS to BigQuery). 

The reason code outside of the Dataflow pipeline construct doesn't work is because:

* In Classic templates - we only store the graph representation.
* In Flex templates - "waitUntilFinish()" can be indefinite. Dataflow tries to avoid keeping the virtual machine (VM) that spins the template up running for a long time, so it ignores the method call.

