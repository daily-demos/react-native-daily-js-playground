# Note that the current script is meant to be run as an `npm` command under 
# DailyPlayground, hence the path relative to that directory
. ./scripts/variables.sh

pushd $PLAYGROUND_DIR
sed -E -i.bak 's|"@daily-co/react-native-daily-js":.*$|"@daily-co/react-native-daily-js": "file:'$RN_DAILY_JS_DIR'/daily-co-react-native-daily-js-'$RN_DAILY_JS_VERSION'.tgz",|' package.json && rm *.bak
popd

pushd $RN_DAILY_JS_DIR
sed -E -i.bak 's|"@daily-co/daily-js":.*$|"@daily-co/daily-js": "file:'$DAILY_JS_DIR'/daily-co-daily-js-'$DAILY_JS_VERSION'.tgz",|' package.json && rm *.bak
sed -E -i.bak 's|"@types/daily-co__daily-js":.*$|"@types/daily-co__daily-js": "file:'$DAILY_TYPES_DIR'",|' package.json && rm *.bak
popd