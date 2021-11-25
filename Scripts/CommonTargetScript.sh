## SwiftLint
#$PODS_ROOT/SwiftLint/swiftlint --config $PROJECT_DIR/../swiftlint.yml

echo "Running CommonTargetScript"

"${MAIN_PROJECT_ROOT}/etc/swiftgen/bin/swiftgen" config run --config $MAIN_PROJECT_ROOT/swiftgen.yml
