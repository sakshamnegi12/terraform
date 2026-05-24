terraform plan --detailed-exitcode

EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
  echo "No infrastructure changes"
elif [ $EXIT_CODE -eq 2 ]; then
  echo "Changes detected"
elif [ $EXIT_CODE -eq 1 ]; then
  echo "Terraform plan failed"
  exit 1
fi
