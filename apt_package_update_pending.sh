echo '# HELP apt_package_update_pending Apt package pending updates by package.'
echo '# TYPE apt_package_update_pending gauge'
/usr/bin/apt-get --just-print dist-upgrade | perl -ne '/^Inst ([^[(]+) (?:\[([^\]]+)\])? ?(?:\(([^ \[]+)[^[]*(?:\[([^\]]+)\])?\))?/gm && print "apt_package_update_pending{name=\"\$1\",oversion=\"\$2\",nversion=\"\$3\",arch=\"\$4\"} 1\n";'
echo '# HELP node_reboot_required Node reboot is required for software updates.'
echo '# TYPE node_reboot_required gauge'
if [[ -f '/run/reboot-required' ]] ; then
  echo 'node_reboot_required 1'
else
  echo 'node_reboot_required 0'
fi