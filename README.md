# ExtractPorts (versión para >/Fish~shell|>)
 ExtractPorts es una función creada por S4vitar. Esta herramienta nos mostrará en formato bat los puertos encontrados y guardados previamente en un archivo. (versión para fish shell)

```
extractPorts allPorts
```
Donde: `allPorts` es el Output en formato normal de un análisis por Nmap

# Instalación
Para instalarlo necesitas instalar `batcat` o `bat`, mientras que a su vez necesitarás precisar del comando `xclip`, si es que tú utilizas Wayland; que es una versión mejorada del comando cat con resaltado de síntaxis y un mejor output formatting; así como pegar lo siguiente en tu `~/.config/fish/fish.config`:

```bash
if status is-interactive
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
    
    # Otros comandos...
end
```
