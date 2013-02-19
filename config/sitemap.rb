require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.mycarcompass.com'
SitemapGenerator::Sitemap.sitemaps_host = "http://s3.amazonaws.com/car-compass/"
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.create do

  add '/how-it-works'
  add '/privacy'
  add '/contact'
  add '/car-articles'
  add '/car-articles/buying'
  add '/cararticles/new-car-tips'
  add '/car-articles/new-truck-tips'
  add '/car-articles/used-car-tips'
  add '/car-articles/used-truck-tips'
  add '/car-articles/financing'
  add '/car-articles/finance-a-car'
  add '/car-articles/maintenance'
  add '/car-articles/tips-to-keep-your-car-running'
  add '/car-articles/summer-maintenance-car-tips'
  add '/car-articles/great-utah-cars'
  add '/car-articles/summer-cars'
  add '/car-articles/winter-cars'
  add '/sold-vehicles'

  Vehicle.find_each do |vehicle|
    add vehicle_path(vehicle), :lastmod => vehicle.updated_at
  end
end

#SitemapGenerator::Sitemap.ping_search_engines # called for you when you use the rake task
