function lambdas {
  local query='
    Functions[][
      [
        FunctionName,
        Runtime
      ]
    ][]
  '
  aws lambda list-functions \
    --output text           \
    --query "$query"        |
  sort                      |
  column -s$'\t' -t
}

function lambda-invoke {
  local payload="{}"
  if [ ! -t 0 ] ; then payload=$(cat) ; fi
  local lambda_line=$(lambdas | $FUZZY_FILTER)
  local lambda_id=$(echo $lambda_line | read_inputs)

  if [ -n "$lambda_id" ]; then
    local out_file="/tmp/awsm-lambda.log"
    aws lambda invoke --function-name $lambda_id \
      --invocation-type RequestResponse \
      --log-type Tail \
      --payload "${payload:-'{}'}" \
      $out_file > /dev/null
    local status=$?

    cat $out_file && rm $out_file

    exit $status
  fi
}

