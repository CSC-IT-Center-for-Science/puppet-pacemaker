class pacemaker::stonith ($disable=true) inherits pacemaker {
  if $disable == true {
    exec {"Disable STONITH":
        command => "/usr/sbin/pcs property set stonith-enabled=false",
        unless => "/usr/sbin/pcs property show stonith-enabled | grep 'stonith-enabled: false'",
    }
  } else {
    exec {"Disable STONITH":
        command => "/usr/sbin/pcs property set stonith-enabled=true",
        onlyif => "/usr/sbin/pcs property show stonith-enabled | grep 'stonith-enabled: false'",
    }
  }
}
