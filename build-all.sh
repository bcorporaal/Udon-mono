#!/bin/bash

# Extract build plan names from private-build-plans.toml using awk, remove trailing ']' and handle duplicates
build_plans=$(awk -F'.' '/^\[buildPlans/ {gsub(/\]$/, "", $2); print $2}' private-build-plans.toml | sort | uniq)

# Run the build command for each unique plan
for plan in $build_plans; do
    echo "Building plan: $plan"
    npm run build -- contents::$plan
done
