export type SiteSettings = {
  id: number;
  business_name: string;
  tagline: string;
  tagline_2: string;
  tagline_3: string;
  phone: string;
  whatsapp: string;
  email: string;
  address: string;
  city: string;
  state: string;
  pincode: string;
  map_location: string;
  business_hours: string;
  hero_title: string;
  hero_subtitle: string;
  hero_description: string;
  hero_image: string;
  hero_video: string;
  logo: string;
  about_title: string;
  about_description: string;
  about_image: string;
  cctv_section_title: string;
  cctv_section_subtitle: string;
  laptop_section_title: string;
  laptop_section_subtitle: string;
  networking_section_title: string;
  domain_section_title: string;
  os_section_title: string;
  instagram: string;
  facebook: string;
  youtube: string;
  linkedin: string;
  seo_title: string;
  seo_description: string;
  seo_keywords: string;
};

export type Service = { id: string; title: string; slug: string; short_description: string; long_description: string; icon: string; image: string; features: string[]; category: string; sort_order: number; is_published: boolean };
export type CctvCategory = { id: string; name: string; slug: string; icon: string; description: string; image: string; sort_order: number; is_published: boolean };
export type CctvProduct = { id: string; name: string; brand: string; model: string; image: string; gallery: string[]; video_url: string; description: string; features: string[]; specifications: Record<string, string>; resolution: string; night_vision: string; storage_support: string; warranty: string; price: number; discount_price: number; stock_status: string; installation_available: boolean; is_published: boolean };
export type LaptopService = { id: string; name: string; slug: string; description: string; icon: string; image: string; is_published: boolean; sort_order: number };
export type Enquiry = { id: string; customer_name: string; phone: string; whatsapp: string; email: string; location: string; service: string; product: string; message: string; status: string; created_at: string };
export type NewsItem = { id: string; title: string; description: string; image: string; news_date: string; is_published: boolean };
export type Testimonial = { id: string; customer_name: string; rating: number; message: string; image: string; is_published: boolean };
export type Faq = { id: string; question: string; answer: string; sort_order: number; is_published: boolean };

export const fallbackSettings: SiteSettings = {
  id: 1, business_name: 'MS INFOTECH', tagline: 'SMART SOLUTIONS • STRONG NETWORKS • SECURE FUTURE', tagline_2: 'YOUR SECURITY IS OUR PRIORITY', tagline_3: 'FAST SERVICE • BEST QUALITY • AFFORDABLE PRICE', phone: '+91 70751 79903', whatsapp: '7075179903', email: 'nathipavankalyan28@gmail.com', address: '', city: 'Hyderabad', state: 'Telangana', pincode: '', map_location: '', business_hours: 'Mon - Sat: 9:00 AM - 8:00 PM', hero_title: 'MS INFOTECH', hero_subtitle: 'COMPLETE IT & SECURITY SOLUTIONS UNDER ONE ROOF', hero_description: 'CCTV • NETWORKING • SERVERS • LAPTOP REPAIR • IT SUPPORT • SECURITY SOLUTIONS', hero_image: 'https://images.pexels.com/photos/37730212/pexels-photo-37730212.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', hero_video: '', logo: '', about_title: 'About MS INFOTECH', about_description: 'MS INFOTECH provides complete IT solutions under one roof. From CCTV surveillance to server setup, laptop repair to network security, we deliver professional services with a commitment to quality and customer satisfaction.', about_image: 'https://images.pexels.com/photos/37605911/pexels-photo-37605911.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', cctv_section_title: 'CCTV CAMERA SALES & INSTALLATION', cctv_section_subtitle: 'COMPLETE SECURITY SOLUTIONS FOR HOME, OFFICE & BUSINESS', laptop_section_title: 'LAPTOP REPAIR', laptop_section_subtitle: 'WE FIX. YOU RELAX.', networking_section_title: 'NETWORKING & SERVER SOLUTIONS', domain_section_title: 'DOMAIN & SERVER SETUP', os_section_title: 'OS INSTALLATION & SOFTWARE SERVICES', instagram: '', facebook: '', youtube: '', linkedin: '', seo_title: 'MS INFOTECH - IT Solutions, CCTV, Networking, Laptop Repair in Hyderabad', seo_description: 'Complete IT, CCTV, networking, server and laptop repair services in Hyderabad.', seo_keywords: 'CCTV Hyderabad, IT services, laptop repair, networking, server setup'
};
