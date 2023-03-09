#!/bin/bash

APP_ROLE_ID="..."
APP_SECRET_ID="..."
APP_ROLE_PATH="services-approle"
SERVICE_NAME="antonio"

# test
vault write auth/$APP_ROLE_PATH/login role_id=$APP_ROLE_ID secret_id=$APP_SECRET_ID