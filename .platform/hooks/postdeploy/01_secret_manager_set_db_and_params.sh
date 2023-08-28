#!/usr/bin/env bash
export SECRET=$(aws secretsmanager get-secret-value --secret-id your-secret-name --region your-aws-region --query SecretString --output text)
export PARAMS=$(aws ssm get-parameter --name your-parameter-name --region your-aws-region --output text --query Parameter.Value --with-decryption)

# retrive the credentials from the SSM and ASM and add it to the .env file.
touch .env
{
  printf "\nDB_CONNECTION_JSON=%s\n" "$SECRET"
  printf "CONFIG_PARAMS='%s'\n" "$PARAMS"
} >> .env