#!/bin/bash

cd tracker-backend
bid=$(git rev-parse HEAD)
cd ../tracker-frontend
fid=$(git rev-parse HEAD)

echo -e "export BACKEND_COMMIT_ID=$bid\nexport FRONTEND_COMMIT_ID=$fid" > commit-ids.sh
