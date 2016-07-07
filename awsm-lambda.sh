AWSM_LAMBDA_SOURCE_FILE=$(realpath ${BASH_SOURCE[0]})
AWSM_LAMBDA_SOURCE_DIR=$(realpath `dirname ${AWSM_LAMBDA_SOURCE_FILE}`/)

source $AWSM_LAMBDA_SOURCE_DIR/awsm-lambda-sh.sh

function lambdas {
  list
}

function lambda {
  $@
}
