TOPLEVEL_DST="/opt/ccs"
VENV_DST="${TOPLEVEL_DST}/venv_weatherdataserver"
WEATHERDATALOGGER_DST="${TOPLEVEL_DST}/WeatherDataServer"
SYSTEMD_SERVICE_DST="/etc/systemd/system"

if [ ! $EUID -eq 0 ]; then
    echo "Please run this install script as root"
    exit
fi

echo "Removing ccsweatherdataserver systemd service..."
systemctl stop ccsweatherdataserver.service
systemctl disable ccsweatherdataserver.service
systemctl daemon-reload
rm "${SYSTEMD_SERVICE_DST}/ccsweatherdataserver.service"

echo "Removing ccsweatherdataserver files"
rm -rf "${WEATHERDATASERVER_DST}" 
rm -rf "${VENV_DST}" 

echo "Uninstall complete"

