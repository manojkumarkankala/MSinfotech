/*
# Seed MS INFOTECH starter content

Adds initial service cards, CCTV categories and products, laptop repair offerings, FAQs, testimonials, and news so the website is populated immediately. All rows remain editable from the admin panel.
*/

INSERT INTO services (title, slug, short_description, long_description, icon, image, features, category, sort_order) VALUES
('IT Services','it-services','Reliable IT support that keeps your business moving.','IT Support, AMC & Maintenance, Remote Support and On-site Support for homes and businesses.','Headphones','https://images.pexels.com/photos/37605911/pexels-photo-37605911.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','["IT Support","AMC & Maintenance","Remote Support","On-site Support"]','core',1),
('IT Networking','it-networking','Build faster, more reliable networks.','LAN/WAN setup, network configuration, structured cabling and Wi-Fi solutions.','Network','https://images.pexels.com/photos/2881232/pexels-photo-2881232.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','["LAN/WAN Setup","Network Configuration","Structured Cabling","Wi-Fi Solutions"]','core',2),
('Firewall & Security','firewall-security','Defend your business from digital threats.','Firewall setup, network security, threat protection and secure VPN configuration.','ShieldCheck','https://images.pexels.com/photos/5483248/pexels-photo-5483248.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','["Firewall Setup","Network Security","Threat Protection","VPN"]','core',3),
('CCTV Surveillance','cctv-surveillance','See more. Worry less. Stay protected.','Professional CCTV installation, IP and analog cameras, remote viewing and AMC.','Cctv','https://images.pexels.com/photos/5966513/pexels-photo-5966513.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','["CCTV Installation","IP Cameras","Remote Viewing","AMC"]','core',4),
('Server Setup','server-setup','Infrastructure built for dependable performance.','Server installation, configuration, backup solutions and maintenance.','Server','https://images.pexels.com/photos/37730212/pexels-photo-37730212.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','["Server Installation","Configuration","Backup Solutions","Maintenance"]','core',5),
('Software Installation','software-installation','Get every system ready for work.','Windows, MS Office, Tally, accounting software and complete system setup.','AppWindow','https://images.pexels.com/photos/256502/pexels-photo-256502.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','["Windows","MS Office","Tally","System Configuration"]','core',6),
('Hardware Installation','hardware-installation','Powerful hardware, installed properly.','Computer setup, hardware upgrades, peripheral setup and system installation.','Cpu','https://images.pexels.com/photos/10558599/pexels-photo-10558599.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','["Computer Setup","Hardware Upgrade","Peripheral Setup","System Installation"]','core',7),
('Laptop Repair','laptop-repair','Expert care for every laptop problem.','Laptop repair, screen replacement, hardware and software repair, SSD and RAM upgrades.','Laptop','https://images.pexels.com/photos/7639374/pexels-photo-7639374.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','["Laptop Repair","Screen Replacement","SSD Upgrade","RAM Upgrade"]','core',8)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cctv_categories (name, slug, icon, image, sort_order) VALUES
('Solar Cameras','solar-cameras','Sun','https://images.pexels.com/photos/96612/pexels-photo-96612.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',1),
('Wi-Fi Cameras','wifi-cameras','Wifi','https://images.pexels.com/photos/5589597/pexels-photo-5589597.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',2),
('Wired Cameras','wired-cameras','Cable','https://images.pexels.com/photos/430208/pexels-photo-430208.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',3),
('IP Cameras','ip-cameras','Globe2','https://images.pexels.com/photos/5966513/pexels-photo-5966513.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',4),
('Dome Cameras','dome-cameras','CircleDot','https://images.pexels.com/photos/7508684/pexels-photo-7508684.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',5),
('Bullet Cameras','bullet-cameras','CircleArrowOutUpRight','https://images.pexels.com/photos/11790823/pexels-photo-11790823.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',6),
('PTZ Cameras','ptz-cameras','Scan','https://images.pexels.com/photos/37591155/pexels-photo-37591155.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',7),
('Night Vision Cameras','night-vision-cameras','Moon','https://images.pexels.com/photos/10233086/pexels-photo-10233086.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',8),
('4G Cameras','4g-cameras','Signal','https://images.pexels.com/photos/5650141/pexels-photo-5650141.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',9)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cctv_products (name, brand, model, image, description, features, resolution, night_vision, storage_support, warranty, price, discount_price, stock_status, installation_available, sort_order) VALUES
('4MP ColorVu IP Dome Camera','Hikvision','DS-2CD2347G2-LU','https://images.pexels.com/photos/7508684/pexels-photo-7508684.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','Smart full-color surveillance for offices, homes and retail spaces.','["4MP high resolution","ColorVu full color at night","Built-in microphone","Weather resistant"]','4MP (2688 × 1520)','Full-color night vision up to 30m','MicroSD up to 256GB / NVR','2 Years','8500','6999','in_stock',true,1),
('5MP Outdoor Bullet Camera','CP Plus','CP-UNC-TA51PL3C','https://images.pexels.com/photos/430208/pexels-photo-430208.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','Reliable outdoor protection with clear details day and night.','["5MP resolution","IR night vision","IP67 weatherproof","Motion detection"]','5MP (2560 × 1920)','IR up to 40m','DVR / NVR','1 Year','6200','4799','in_stock',true,2),
('Smart Wi-Fi Indoor Camera','IMOU','Ranger 2','https://images.pexels.com/photos/5589597/pexels-photo-5589597.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','Simple mobile monitoring for homes, shops and small offices.','["360° pan and tilt","Two-way audio","Smart tracking","Mobile alerts"]','3MP Full HD','IR up to 10m','MicroSD up to 256GB','1 Year','4200','2999','in_stock',true,3)
ON CONFLICT DO NOTHING;

INSERT INTO laptop_services (name, slug, description, icon, image, sort_order) VALUES
('Laptop Storage Exchange','laptop-storage-exchange','Replace a failing drive and protect your important files.','HardDrive','https://images.pexels.com/photos/7639374/pexels-photo-7639374.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',1),
('SSD Upgrade & Exchange','ssd-upgrade','Make your laptop dramatically faster with a genuine SSD.','Zap','https://images.pexels.com/photos/34514242/pexels-photo-34514242.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',2),
('RAM Upgrade & Exchange','ram-upgrade','Run more applications smoothly with the right memory upgrade.','MemoryStick','https://images.pexels.com/photos/7639355/pexels-photo-7639355.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',3),
('Full Laptop Repair','full-laptop-repair','Complete diagnosis and repair for hardware and software problems.','Wrench','https://images.pexels.com/photos/10558599/pexels-photo-10558599.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',4),
('Screen Replacement','screen-replacement','High-quality replacement screens fitted by expert technicians.','Monitor','https://images.pexels.com/photos/34514242/pexels-photo-34514242.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',5),
('Keyboard & Battery','keyboard-battery','Restore comfort and reliable battery life.','Keyboard','https://images.pexels.com/photos/7639373/pexels-photo-7639373.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',6),
('OS & Software Installation','os-software','Windows, drivers, Office and essential software installed correctly.','Settings2','https://images.pexels.com/photos/256502/pexels-photo-256502.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',7),
('Refurbished Laptops','refurbished-laptops','Quality-checked laptops for dependable everyday computing.','Laptop','https://images.pexels.com/photos/34514242/pexels-photo-34514242.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',8)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO testimonials (customer_name, rating, message) VALUES
('Srinivas Reddy',5,'MS INFOTECH installed cameras across our office quickly and professionally. The mobile viewing setup is excellent.'),
('Anitha Kumar',5,'My laptop was repaired the same day. Transparent pricing, genuine parts and very helpful technicians.'),
('Vamsi Krishna',5,'They handled our complete network and server setup with great attention to detail. Highly recommended.')
ON CONFLICT DO NOTHING;

INSERT INTO faqs (question, answer, sort_order) VALUES
('Do you provide CCTV installation in Hyderabad?','Yes. We provide complete CCTV sales, installation, configuration and after-sales support across Hyderabad and nearby areas.',1),
('Can you visit our office for IT support?','Yes. Our on-site support team can visit homes, offices, shops and institutions for diagnosis and service.',2),
('Do you offer AMC plans?','Yes. We offer flexible annual maintenance plans for CCTV, computers, networks and servers.',3),
('How quickly can you repair a laptop?','Many common repairs can be completed the same day. We confirm the timeline after diagnosis.',4)
ON CONFLICT DO NOTHING;

INSERT INTO news (title, description, image, news_date) VALUES
('Complete CCTV solutions for Hyderabad businesses','Protect your home, office or shop with professional camera selection, installation and mobile monitoring.','https://images.pexels.com/photos/96612/pexels-photo-96612.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',CURRENT_DATE),
('Upgrade your laptop with a genuine SSD','A fast SSD upgrade can transform an older laptop. Ask our technicians about compatible options.','https://images.pexels.com/photos/7639374/pexels-photo-7639374.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',CURRENT_DATE - 2)
ON CONFLICT DO NOTHING;

UPDATE site_settings SET hero_image='https://images.pexels.com/photos/37730212/pexels-photo-37730212.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', about_image='https://images.pexels.com/photos/37605911/pexels-photo-37605911.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', tagline='SMART SOLUTIONS • STRONG NETWORKS • SECURE FUTURE', tagline_2='YOUR SECURITY IS OUR PRIORITY', tagline_3='FAST SERVICE • BEST QUALITY • AFFORDABLE PRICE' WHERE id=1;