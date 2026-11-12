/*
# MS INFOTECH CMS schema

Creates the public website content and admin-managed tables for services, CCTV products, laptop services, enquiries, news, testimonials, FAQs, media, custom pages, site settings, and login tracking.

All content is publicly readable. All CMS writes require an authenticated admin. Enquiry submission and login-attempt tracking are public inserts only.
*/

CREATE TABLE IF NOT EXISTS site_settings (
 id int PRIMARY KEY DEFAULT 1, business_name text NOT NULL DEFAULT 'MS INFOTECH', tagline text NOT NULL DEFAULT 'SMART SOLUTIONS • STRONG NETWORKS • SECURE FUTURE', tagline_2 text DEFAULT 'YOUR SECURITY IS OUR PRIORITY', tagline_3 text DEFAULT 'FAST SERVICE • BEST QUALITY • AFFORDABLE PRICE', phone text NOT NULL DEFAULT '+91 70751 79903', whatsapp text NOT NULL DEFAULT '7075179903', email text NOT NULL DEFAULT 'nathipavankalyan28@gmail.com', address text DEFAULT '', city text DEFAULT 'Hyderabad', state text DEFAULT 'Telangana', pincode text DEFAULT '', map_location text DEFAULT '', business_hours text DEFAULT 'Mon - Sat: 9:00 AM - 8:00 PM', hero_title text DEFAULT 'MS INFOTECH', hero_subtitle text DEFAULT 'COMPLETE IT & SECURITY SOLUTIONS UNDER ONE ROOF', hero_description text DEFAULT 'CCTV • NETWORKING • SERVERS • LAPTOP REPAIR • IT SUPPORT • SECURITY SOLUTIONS', hero_image text DEFAULT '', hero_video text DEFAULT '', logo text DEFAULT '', about_title text DEFAULT 'About MS INFOTECH', about_description text DEFAULT 'MS INFOTECH provides complete IT solutions under one roof. From CCTV surveillance to server setup, laptop repair to network security, we deliver professional services with a commitment to quality and customer satisfaction.', about_image text DEFAULT '', cctv_section_title text DEFAULT 'CCTV CAMERA SALES & INSTALLATION', cctv_section_subtitle text DEFAULT 'COMPLETE SECURITY SOLUTIONS FOR HOME, OFFICE & BUSINESS', laptop_section_title text DEFAULT 'LAPTOP REPAIR', laptop_section_subtitle text DEFAULT 'WE FIX. YOU RELAX.', networking_section_title text DEFAULT 'NETWORKING & SERVER SOLUTIONS', domain_section_title text DEFAULT 'DOMAIN & SERVER SETUP', os_section_title text DEFAULT 'OS INSTALLATION & SOFTWARE SERVICES', instagram text DEFAULT '', facebook text DEFAULT '', youtube text DEFAULT '', linkedin text DEFAULT '', seo_title text DEFAULT 'MS INFOTECH - IT Solutions, CCTV, Networking, Laptop Repair in Hyderabad', seo_description text DEFAULT 'MS INFOTECH offers complete IT solutions including CCTV installation, networking, server setup, laptop repair, and security services in Hyderabad.', seo_keywords text DEFAULT 'CCTV installation Hyderabad, IT services, laptop repair, networking, server setup, firewall security', updated_at timestamptz DEFAULT now()
);
INSERT INTO site_settings(id) VALUES(1) ON CONFLICT DO NOTHING;

CREATE TABLE IF NOT EXISTS services (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), title text NOT NULL, slug text NOT NULL UNIQUE, short_description text DEFAULT '', long_description text DEFAULT '', icon text DEFAULT 'Settings', image text DEFAULT '', features jsonb DEFAULT '[]'::jsonb, category text DEFAULT 'general', sort_order int DEFAULT 0, is_published boolean DEFAULT true, created_at timestamptz DEFAULT now(), updated_at timestamptz DEFAULT now());
CREATE TABLE IF NOT EXISTS cctv_categories (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), name text NOT NULL, slug text NOT NULL UNIQUE, icon text DEFAULT 'Camera', description text DEFAULT '', image text DEFAULT '', sort_order int DEFAULT 0, is_published boolean DEFAULT true, created_at timestamptz DEFAULT now());
CREATE TABLE IF NOT EXISTS cctv_products (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), name text NOT NULL, brand text DEFAULT '', model text DEFAULT '', category_id uuid REFERENCES cctv_categories(id) ON DELETE SET NULL, image text DEFAULT '', gallery jsonb DEFAULT '[]'::jsonb, video_url text DEFAULT '', description text DEFAULT '', features jsonb DEFAULT '[]'::jsonb, specifications jsonb DEFAULT '{}'::jsonb, resolution text DEFAULT '', night_vision text DEFAULT '', storage_support text DEFAULT '', warranty text DEFAULT '', price numeric DEFAULT 0, discount_price numeric DEFAULT 0, stock_status text DEFAULT 'in_stock', installation_available boolean DEFAULT true, is_published boolean DEFAULT true, sort_order int DEFAULT 0, created_at timestamptz DEFAULT now(), updated_at timestamptz DEFAULT now());
CREATE TABLE IF NOT EXISTS laptop_services (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), name text NOT NULL, slug text NOT NULL UNIQUE, description text DEFAULT '', icon text DEFAULT 'Laptop', image text DEFAULT '', is_published boolean DEFAULT true, sort_order int DEFAULT 0, created_at timestamptz DEFAULT now());
CREATE TABLE IF NOT EXISTS enquiries (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), customer_name text NOT NULL, phone text DEFAULT '', whatsapp text DEFAULT '', email text DEFAULT '', location text DEFAULT '', service text DEFAULT '', product text DEFAULT '', message text DEFAULT '', status text NOT NULL DEFAULT 'new', created_at timestamptz DEFAULT now(), updated_at timestamptz DEFAULT now());
CREATE TABLE IF NOT EXISTS news (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), title text NOT NULL, description text DEFAULT '', image text DEFAULT '', news_date date DEFAULT CURRENT_DATE, is_published boolean DEFAULT true, created_at timestamptz DEFAULT now(), updated_at timestamptz DEFAULT now());
CREATE TABLE IF NOT EXISTS testimonials (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), customer_name text NOT NULL, rating int DEFAULT 5, message text DEFAULT '', image text DEFAULT '', is_published boolean DEFAULT true, sort_order int DEFAULT 0, created_at timestamptz DEFAULT now());
CREATE TABLE IF NOT EXISTS faqs (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), question text NOT NULL, answer text DEFAULT '', sort_order int DEFAULT 0, is_published boolean DEFAULT true, created_at timestamptz DEFAULT now());
CREATE TABLE IF NOT EXISTS media (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), type text NOT NULL DEFAULT 'image', url text NOT NULL, title text DEFAULT '', description text DEFAULT '', alt_text text DEFAULT '', category text DEFAULT 'gallery', thumbnail text DEFAULT '', is_featured boolean DEFAULT false, is_published boolean DEFAULT true, created_at timestamptz DEFAULT now());
CREATE TABLE IF NOT EXISTS pages (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), title text NOT NULL, slug text NOT NULL UNIQUE, description text DEFAULT '', content jsonb DEFAULT '{}'::jsonb, is_published boolean DEFAULT true, created_at timestamptz DEFAULT now(), updated_at timestamptz DEFAULT now());
CREATE TABLE IF NOT EXISTS login_attempts (id uuid PRIMARY KEY DEFAULT gen_random_uuid(), email text DEFAULT '', ip_address text DEFAULT '', success boolean DEFAULT false, created_at timestamptz DEFAULT now());

ALTER TABLE site_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE services ENABLE ROW LEVEL SECURITY;
ALTER TABLE cctv_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE cctv_products ENABLE ROW LEVEL SECURITY;
ALTER TABLE laptop_services ENABLE ROW LEVEL SECURITY;
ALTER TABLE enquiries ENABLE ROW LEVEL SECURITY;
ALTER TABLE news ENABLE ROW LEVEL SECURITY;
ALTER TABLE testimonials ENABLE ROW LEVEL SECURITY;
ALTER TABLE faqs ENABLE ROW LEVEL SECURITY;
ALTER TABLE media ENABLE ROW LEVEL SECURITY;
ALTER TABLE pages ENABLE ROW LEVEL SECURITY;
ALTER TABLE login_attempts ENABLE ROW LEVEL SECURITY;

-- Public read policies for content
DROP POLICY IF EXISTS "public_read_site_settings" ON site_settings; CREATE POLICY "public_read_site_settings" ON site_settings FOR SELECT TO anon, authenticated USING (true);
DROP POLICY IF EXISTS "public_read_services" ON services; CREATE POLICY "public_read_services" ON services FOR SELECT TO anon, authenticated USING (true);
DROP POLICY IF EXISTS "public_read_cctv_categories" ON cctv_categories; CREATE POLICY "public_read_cctv_categories" ON cctv_categories FOR SELECT TO anon, authenticated USING (true);
DROP POLICY IF EXISTS "public_read_cctv_products" ON cctv_products; CREATE POLICY "public_read_cctv_products" ON cctv_products FOR SELECT TO anon, authenticated USING (true);
DROP POLICY IF EXISTS "public_read_laptop_services" ON laptop_services; CREATE POLICY "public_read_laptop_services" ON laptop_services FOR SELECT TO anon, authenticated USING (true);
DROP POLICY IF EXISTS "public_read_news" ON news; CREATE POLICY "public_read_news" ON news FOR SELECT TO anon, authenticated USING (true);
DROP POLICY IF EXISTS "public_read_testimonials" ON testimonials; CREATE POLICY "public_read_testimonials" ON testimonials FOR SELECT TO anon, authenticated USING (true);
DROP POLICY IF EXISTS "public_read_faqs" ON faqs; CREATE POLICY "public_read_faqs" ON faqs FOR SELECT TO anon, authenticated USING (true);
DROP POLICY IF EXISTS "public_read_media" ON media; CREATE POLICY "public_read_media" ON media FOR SELECT TO anon, authenticated USING (true);
DROP POLICY IF EXISTS "public_read_pages" ON pages; CREATE POLICY "public_read_pages" ON pages FOR SELECT TO anon, authenticated USING (true);

-- Public inserts
DROP POLICY IF EXISTS "public_insert_enquiries" ON enquiries; CREATE POLICY "public_insert_enquiries" ON enquiries FOR INSERT TO anon, authenticated WITH CHECK (true);
DROP POLICY IF EXISTS "public_insert_login_attempts" ON login_attempts; CREATE POLICY "public_insert_login_attempts" ON login_attempts FOR INSERT TO anon, authenticated WITH CHECK (true);

-- Admin CMS policies (one per CRUD verb)
DO $$ DECLARE t text; BEGIN FOREACH t IN ARRAY ARRAY['site_settings','services','cctv_categories','cctv_products','laptop_services','news','testimonials','faqs','media','pages'] LOOP
 EXECUTE format('DROP POLICY IF EXISTS %I ON %I', 'admin_insert_'||t, t);
 EXECUTE format('CREATE POLICY %I ON %I FOR INSERT TO authenticated WITH CHECK (EXISTS (SELECT 1 FROM admin_users WHERE admin_users.user_id = auth.uid()))', 'admin_insert_'||t, t);
 EXECUTE format('DROP POLICY IF EXISTS %I ON %I', 'admin_update_'||t, t);
 EXECUTE format('CREATE POLICY %I ON %I FOR UPDATE TO authenticated USING (EXISTS (SELECT 1 FROM admin_users WHERE admin_users.user_id = auth.uid())) WITH CHECK (EXISTS (SELECT 1 FROM admin_users WHERE admin_users.user_id = auth.uid()))', 'admin_update_'||t, t);
 EXECUTE format('DROP POLICY IF EXISTS %I ON %I', 'admin_delete_'||t, t);
 EXECUTE format('CREATE POLICY %I ON %I FOR DELETE TO authenticated USING (EXISTS (SELECT 1 FROM admin_users WHERE admin_users.user_id = auth.uid()))', 'admin_delete_'||t, t);
 END LOOP; END $$;

DROP POLICY IF EXISTS "admin_read_enquiries" ON enquiries; CREATE POLICY "admin_read_enquiries" ON enquiries FOR SELECT TO authenticated USING (EXISTS (SELECT 1 FROM admin_users WHERE admin_users.user_id = auth.uid()));
DROP POLICY IF EXISTS "admin_update_enquiries" ON enquiries; CREATE POLICY "admin_update_enquiries" ON enquiries FOR UPDATE TO authenticated USING (EXISTS (SELECT 1 FROM admin_users WHERE admin_users.user_id = auth.uid())) WITH CHECK (EXISTS (SELECT 1 FROM admin_users WHERE admin_users.user_id = auth.uid()));
DROP POLICY IF EXISTS "admin_delete_enquiries" ON enquiries; CREATE POLICY "admin_delete_enquiries" ON enquiries FOR DELETE TO authenticated USING (EXISTS (SELECT 1 FROM admin_users WHERE admin_users.user_id = auth.uid()));
DROP POLICY IF EXISTS "admin_read_login_attempts" ON login_attempts; CREATE POLICY "admin_read_login_attempts" ON login_attempts FOR SELECT TO authenticated USING (EXISTS (SELECT 1 FROM admin_users WHERE admin_users.user_id = auth.uid()));
DROP POLICY IF EXISTS "admin_delete_login_attempts" ON login_attempts; CREATE POLICY "admin_delete_login_attempts" ON login_attempts FOR DELETE TO authenticated USING (EXISTS (SELECT 1 FROM admin_users WHERE admin_users.user_id = auth.uid()));

CREATE INDEX IF NOT EXISTS idx_services_slug ON services(slug); CREATE INDEX IF NOT EXISTS idx_services_published ON services(is_published); CREATE INDEX IF NOT EXISTS idx_products_category ON cctv_products(category_id); CREATE INDEX IF NOT EXISTS idx_enquiries_status ON enquiries(status); CREATE INDEX IF NOT EXISTS idx_enquiries_created ON enquiries(created_at DESC); CREATE INDEX IF NOT EXISTS idx_news_date ON news(news_date DESC); CREATE INDEX IF NOT EXISTS idx_media_category ON media(category); CREATE INDEX IF NOT EXISTS idx_pages_slug ON pages(slug);