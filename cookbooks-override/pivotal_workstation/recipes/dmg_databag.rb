include_recipe "dmg"

installed_dmgs = node['install_dmgs']

installed_dmgs.each do |dmg|
  d = data_bag_item('dmgs', dmg)
  dmg_package d['name'] do
    volumes_dir d['volumes_dir']
    source d['source']
    checksum d['checksum']
    action :nothing
  end
end
