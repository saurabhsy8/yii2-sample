#!/usr/bin/env bash
export SECRET=$(aws secretsmanager get-secret-value --secret-id SECRET_NAME --region AWS_REGION --query SecretString --output text)
export PARAMS=$(aws ssm get-parameter --name PARAMETER_NAME --region your-aws-region --output text --query Parameter.Value --with-decryption)

# retrive the credentials from the SSM and ASM and add it to the .env file.
touch .env
{
  printf "\nDB_CONNECTION_JSON=%s\n" "$SECRET"
  printf "CONFIG_PARAMS='%s'\n" "$PARAMS"
} >> .env