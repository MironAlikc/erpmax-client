#!/bin/bash

# ERPMax Integration Tests Runner
# This script runs all integration tests with proper configuration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}ERPMax Integration Tests${NC}"
echo "================================"

# Check if server is running
echo -e "\n${YELLOW}Checking server connection...${NC}"
SERVER_URL="${TEST_BASE_URL:-http://localhost:8000}"

if curl -s -f -o /dev/null "$SERVER_URL/health" 2>/dev/null || curl -s -f -o /dev/null "$SERVER_URL/api/v1/health" 2>/dev/null; then
    echo -e "${GREEN}✓ Server is running at $SERVER_URL${NC}"
else
    echo -e "${RED}✗ Server is not responding at $SERVER_URL${NC}"
    echo -e "${YELLOW}Please start the backend server before running tests${NC}"
    exit 1
fi

# Check Flutter installation
echo -e "\n${YELLOW}Checking Flutter installation...${NC}"
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}✗ Flutter is not installed${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Flutter is installed${NC}"

# Install dependencies
echo -e "\n${YELLOW}Installing dependencies...${NC}"
flutter pub get

# Run tests
echo -e "\n${YELLOW}Running integration tests...${NC}"
echo "================================"

TEST_SUITES=(
    "auth_api_test.dart"
    "tenant_api_test.dart"
    "billing_api_test.dart"
    "provisioning_api_test.dart"
    "sso_api_test.dart"
)

FAILED_TESTS=()
PASSED_TESTS=()

for test in "${TEST_SUITES[@]}"; do
    echo -e "\n${YELLOW}Running $test...${NC}"
    
    if flutter test "test/integration/$test" \
        --dart-define=TEST_BASE_URL="${TEST_BASE_URL:-http://localhost:8000}" \
        --dart-define=VERBOSE_LOGGING="${VERBOSE_LOGGING:-true}" \
        --dart-define=SKIP_CLEANUP="${SKIP_CLEANUP:-false}"; then
        echo -e "${GREEN}✓ $test passed${NC}"
        PASSED_TESTS+=("$test")
    else
        echo -e "${RED}✗ $test failed${NC}"
        FAILED_TESTS+=("$test")
    fi
done

# Summary
echo -e "\n================================"
echo -e "${GREEN}Test Summary${NC}"
echo "================================"
echo -e "${GREEN}Passed: ${#PASSED_TESTS[@]}${NC}"
echo -e "${RED}Failed: ${#FAILED_TESTS[@]}${NC}"

if [ ${#FAILED_TESTS[@]} -gt 0 ]; then
    echo -e "\n${RED}Failed tests:${NC}"
    for test in "${FAILED_TESTS[@]}"; do
        echo -e "  - $test"
    done
    exit 1
else
    echo -e "\n${GREEN}All tests passed! 🎉${NC}"
    exit 0
fi
