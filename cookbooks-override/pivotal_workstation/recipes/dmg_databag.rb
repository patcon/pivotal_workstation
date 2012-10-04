include_recipe "dmg"

installed_dmgs = node['install_dmgs']

installed_dmgs.each do |dmg|
  d = data_bag_item('dmgs', dmg)
  dmg_package d['id'] do
    d.each do |res_attr, value|
      send(res_attr, value) unless res_attr == 'id'
    end
    action :nothing
  end
end
