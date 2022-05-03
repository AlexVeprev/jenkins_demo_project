
# Bash variant was implemented as PoC and kept for reference, Groovy variant is actually used (see Jenkinsfile).
set -e -x

REPO=$1
TAG=$2
ASSET=$3

# Create release
curl \
  -o release.json \
  -w "%{http_code}" \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/repos/$REPO/releases \
  -d "{\"tag_name\":\"${TAG}\",\"name\":\"$TAG\"}" > http_code

cat release.json
echo "http_code: $(cat http_code)"
grep 201 http_code


# Attach asset
release_id=$(jq -r '.id' release.json)

curl \
  -o release_asset.json \
  -w "%{http_code}" \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Content-Type: $(file -b --mime-type $ASSET)" \
  --data-binary @$ASSET \
  "https://uploads.github.com/repos/$REPO/releases/$release_id/assets?name=$(basename $ASSET)" > http_code

cat release_asset.json
echo "http_code: $(cat http_code)"
grep 201 http_code
