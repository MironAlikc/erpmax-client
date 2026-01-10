# Integration Test Results Template

## Test Execution Summary

**Date**: [Date]
**Tester**: [Name]
**Server**: [URL]
**Flutter Version**: [Version]

---

## Test Results

### Auth API Tests

- [ ] POST /auth/register - User registration
- [ ] POST /auth/login - User login
- [ ] GET /auth/me - Get current user
- [ ] POST /auth/refresh - Refresh token
- [ ] POST /auth/switch-tenant - Switch tenant
- [ ] POST /auth/logout - Logout
- [ ] Model to Entity conversions

**Status**: ⬜ Not Run | ✅ Passed | ❌ Failed
**Notes**:

---

### Tenant API Tests

- [ ] GET /tenants - Get all tenants
- [ ] GET /tenants/current - Get current tenant
- [ ] GET /tenants/{id} - Get tenant by ID
- [ ] PATCH /tenants/{id} - Update tenant
- [ ] GET /tenants/{id}/users - Get tenant users
- [ ] POST /tenants/{id}/users/invite - Invite user
- [ ] Model to Entity conversions

**Status**: ⬜ Not Run | ✅ Passed | ❌ Failed
**Notes**:

---

### Billing API Tests

- [ ] GET /billing/plans - Get plans
- [ ] GET /billing/subscription - Get subscription
- [ ] POST /billing/checkout - Create checkout
- [ ] GET /billing/invoices - Get invoices
- [ ] POST /billing/cancel - Cancel subscription
- [ ] Model to Entity conversions

**Status**: ⬜ Not Run | ✅ Passed | ❌ Failed
**Notes**:

---

### Provisioning API Tests

- [ ] POST /provisioning/jobs - Create job
- [ ] GET /provisioning/jobs - Get all jobs
- [ ] GET /provisioning/jobs/{id} - Get job by ID
- [ ] POST /provisioning/jobs/{id}/retry - Retry job
- [ ] POST /provisioning/jobs/{id}/cancel - Cancel job
- [ ] Model to Entity conversions

**Status**: ⬜ Not Run | ✅ Passed | ❌ Failed
**Notes**:

---

### SSO API Tests

- [ ] POST /sso/token - Generate token
- [ ] GET /sso/erpnext/validate/{token} - Validate token
- [ ] Token expiration validation
- [ ] Invalid token handling
- [ ] Model to Entity conversions

**Status**: ⬜ Not Run | ✅ Passed | ❌ Failed
**Notes**:

---

## Issues Found

### Critical Issues

1.

### Minor Issues

1.

### Observations

1.

---

## Recommendations

1.
2.
3.

---

## Next Steps

- [ ] Fix critical issues
- [ ] Address minor issues
- [ ] Update documentation
- [ ] Re-run failed tests
- [ ] Deploy to staging

---

**Signed Off By**: [Name]
**Date**: [Date]
