## SwiftLint
#$PODS_ROOT/SwiftLint/swiftlint --config $PROJECT_DIR/../swiftlint.yml

echo "Running CommonTargetScript"

"${SWIFT_GEN_YML_ROOT}/etc/swiftgen/bin/swiftgen" config run --config $SWIFT_GEN_YML_ROOT/swiftgen.yml
