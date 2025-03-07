# ExtractPorts (versión para >/Fish~shell|>)
 ExtractPorts es una función creada por S4vitar. Esta herramienta nos mostrará en formato bat los puertos encontrados y guardados previamente en un archivo. (versión para fish shell)

```
extractPorts allPorts
```
Donde: `allPorts` es el Output en formato normal de un análisis por Nmap

# Instalación
Para instalarlo necesitas instalar `batcat` o `bat`; que es una versión mejorada del comando cat con resaltado de síntaxis y un mejor output formatting; así como pegar lo siguiente en tu `~/.config/fish/fish.config`:

```bash
if status is-interactive
    function extractPorts
        set ports (cat argv[1] | grep -oP '\d{1,5}/open' | awk '{print 1}')
        set ip_address (cat argv[1]∣grep−oP′\d1,3\d˙​1,3\d˙​1,3\d˙​1,3′)echo−e"\n[∗]Extractinginformation...\n">extractPorts.tmpecho−e"\t[∗]IPAddress:ip_address"  >> extractPorts.tmp
        echo -e "\t[] Open ports: ports\n">>extractPorts.tmpechoports | tr -d '\n' | xclip -sel clip
        echo -e "[] Ports copied to clipboard\n"  >> extractPorts.tmp
        cat extractPorts.tmp; rm extractPorts.tmp
    end
    
    # Otros comandos...
end
```
