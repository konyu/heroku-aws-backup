# sample backup shell
echo "start daily buckup!!"

echo "== stopping worker =="
heroku ps:scale worker=0 -a APP_BE_BAKED_UP

echo "== copying database to preview from production =="
heroku pg:copy ORIGINAL_DB_NAME DB_TO_BE_COPIED --confirm APP_BE_BAKED_UP -a APP_BE_BAKED_UP

echo "== clearing jobs =="
heroku run rake jobs:clear -a APP_BE_BAKED_UP

echo "== copying s3 bucket to staging from production =="
aws s3 sync --delete --acl public-read s3://ORIGINAL_BUCKET s3://BUCKET_TO_BE_COPIED

echo "== starting worker =="
heroku ps:scale worker=1 -a APP_BE_BAKED_UP
