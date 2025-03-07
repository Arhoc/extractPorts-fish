function extractPorts
    set input_file $argv[1]
    if test -z "$input_file"
        set input_file /dev/stdin
    end

    set ports (grep -oP '\d+/tcp open' $input_file | awk '{print $1}' | sed -e 's/\/tcp//' | tr '\n' ',' | sed 's/,$//')
    set ip_address (grep -oP 'Scan.+?\K\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' $input_file | head -n 1)

    echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
    echo -e "\t[*] IP Address: $ip_address" >> extractPorts.tmp
    echo -e "\t[*] Open ports: $ports\n" >> extractPorts.tmp
    
    echo $ports | tr -d '\n' | xclip -sel clip
    echo -e "[*] Ports copied to clipboard\n" >> extractPorts.tmp
    cat extractPorts.tmp; rm extractPorts.tmp
end
