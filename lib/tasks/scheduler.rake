desc "This task updates the vehicles on Car Compass."
task :update_inventory => :environment do
  puts "Updating vehicles ..."
  VehicleImport.new.process
  puts "... done."
end
