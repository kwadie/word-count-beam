
  mvn compile exec:java -Dexec.mainClass=org.apache.beam.examples.WordCountWithCounters \
       -Dexec.args="--runner=DataflowRunner --project=${PROJECT} \
                    --region=${REGION} \
                    --gcpTempLocation=${TEMP_GCS} \
                    --output=${OUTPUT_GCS} \
                    --bucket=${METRICS_BUCKET}" \
       -Pdataflow-runner