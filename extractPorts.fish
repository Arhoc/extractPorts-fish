function extractPorts
    set ports (cat argv[1] | grep -oP '\d{1,5}/open' | awk '{print 1}')
    set ip_address (cat argv[1]∣grep−oP′\d1,3\d˙​1,3\d˙​1,3\d˙​1,3′)echo−e"\n[∗]Extractinginformation...\n">extractPorts.tmpecho−e"\t[∗]IPAddress:ip_address"  >> extractPorts.tmp
    echo -e "\t[] Open ports: ports\n">>extractPorts.tmpechoports | tr -d '\n' | xclip -sel clip
    echo -e "[] Ports copied to clipboard\n"  >> extractPorts.tmp
    cat extractPorts.tmp; rm extractPorts.tmp
end
