/*
# Create MS INFOTECH admin foundation

Creates the admin_users table first so all CMS write policies can safely reference it.
RLS is enabled. Authenticated admins can read their admin records; public users cannot.
*/
CREATE TABLE IF NOT EXISTS admin_users (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  email text NOT NULL,
  role text NOT NULL DEFAULT 'super_admin',
  created_at timestamptz DEFAULT now()
);
ALTER TABLE admin_users ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "admin_read_admin_users" ON admin_users;
CREATE POLICY "admin_read_admin_users" ON admin_users FOR SELECT TO authenticated USING (EXISTS (SELECT 1 FROM admin_users au WHERE au.user_id = auth.uid()));
DROP POLICY IF EXISTS "super_admin_insert_admin_users" ON admin_users;
CREATE POLICY "super_admin_insert_admin_users" ON admin_users FOR INSERT TO authenticated WITH CHECK (EXISTS (SELECT 1 FROM admin_users au WHERE au.user_id = auth.uid() AND au.role = 'super_admin'));
DROP POLICY IF EXISTS "admin_update_admin_users" ON admin_users;
CREATE POLICY "admin_update_admin_users" ON admin_users FOR UPDATE TO authenticated USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
DROP POLICY IF EXISTS "super_admin_delete_admin_users" ON admin_users;
CREATE POLICY "super_admin_delete_admin_users" ON admin_users FOR DELETE TO authenticated USING (EXISTS (SELECT 1 FROM admin_users au WHERE au.user_id = auth.uid() AND au.role = 'super_admin'));

CREATE OR REPLACE FUNCTION admin_exists()
RETURNS boolean LANGUAGE sql SECURITY DEFINER SET search_path = public
AS $$ SELECT EXISTS (SELECT 1 FROM admin_users LIMIT 1); $$;
GRANT EXECUTE ON FUNCTION admin_exists() TO anon, authenticated;

CREATE OR REPLACE FUNCTION get_admin_count()
RETURNS int LANGUAGE sql SECURITY DEFINER SET search_path = public
AS $$ SELECT COUNT(*)::int FROM admin_users; $$;
GRANT EXECUTE ON FUNCTION get_admin_count() TO anon, authenticated;