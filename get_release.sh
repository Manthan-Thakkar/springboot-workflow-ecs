output=$(curl -L -s \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer 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" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$GITHUB_REPOSITORY/releases | jq -r '.[].tag_name')

github_tag=$GITHUB_REF_NAME

echo $output
match=false
# echo $match
for tag in $output; do
    if [ "$tag" == "$github_tag" ]; then
        match=true
        break
    fi
done
echo $match
# Output the result
if [ "$match" = true ]; then
    echo "The GitHub input variable matches one of the output values."
else
    echo "The GitHub input variable does not match any of the output values."
    exit 1
fi