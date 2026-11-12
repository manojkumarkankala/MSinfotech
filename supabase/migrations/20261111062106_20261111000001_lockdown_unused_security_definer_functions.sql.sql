/*
# Lock down unused SECURITY DEFINER functions

1. Security changes
- Revoke EXECUTE on `admin_exists()` and `get_admin_count()` from PUBLIC, anon, and authenticated.
- These two helper functions were created during admin foundation setup but are never called
  by the frontend or the admin-setup edge function (which uses the service role key directly).
- They are SECURITY DEFINER functions, so leaving them callable by anon/authenticated exposes
  them as public RPCs (`/rest/v1/rpc/admin_exists`, `/rest/v1/rpc/get_admin_count`).
- After this migration, only roles with explicit EXECUTE grants (service_role by default)
  can call them, closing the linter warnings.
*/

REVOKE EXECUTE ON FUNCTION admin_exists() FROM PUBLIC, anon, authenticated;
REVOKE EXECUTE ON FUNCTION get_admin_count() FROM PUBLIC, anon, authenticated;
