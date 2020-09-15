username = "my_os_username"
external_network_uuid="xxxx-xxxx-xxxx-xxxx"
port_rules = [
   {
     name              = "tcp22open"
     direction         = "ingress"
     ethertype         = "IPv4"
     protocol          = "tcp"
     port_range_min    = 22
     port_range_max    = 22
     remote_ip_prefix  = "0.0.0.0/0"
   },
   {
     name              = "tcp80open"
     direction         = "ingress"
     ethertype         = "IPv4"
     protocol          = "tcp"
     port_range_min    = 80
     port_range_max    = 80
     remote_ip_prefix  = "0.0.0.0/0"
   }
]
