#!/bin/bash
echo "Static websites ON"
# az storage blob service-properties update \
#     --auth-mode "login" \
#     --account-name "ppaszek123" \
#     --static-website \
#     --404-document "error.html" \
#     --index-document "index.html" \
#     --verbose \
#     -o table
az storage blob service-properties update \
--account-name "ppaszek123" \
--static-website \
--404-document "error.html"\
--index-document "index.html"