AWSM_LAMBDA_SOURCE_FILE=$(realpath ${BASH_SOURCE[0]})
AWSM_LAMBDA_SOURCE_DIR=$(realpath `dirname ${AWSM_LAMBDA_SOURCE_FILE}`/)

function lambdas {
  source $AWSM_LAMBDA_SOURCE_DIR/awsm-lambda-sh.sh
  list
}

function lambda {
  source $AWSM_LAMBDA_SOURCE_DIR/awsm-lambda-sh.sh
  $@
}
