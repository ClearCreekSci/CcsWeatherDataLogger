TOPLEVEL_DST="/opt/ccs"
VENV_DST="${TOPLEVEL_DST}/venv_weatherdatalogger"
WEATHERDATALOGGER_DST="${TOPLEVEL_DST}/WeatherDataLogger"
SYSTEMD_SERVICE_DST="/etc/systemd/system"

echo "Removing ccsweatherdatalogger systemd service..."
systemctl stop ccsweatherdatalogger.service
systemctl disable ccsweatherdatalogger.service
systemctl daemon-reload
rm "${SYSTEMD_SERVICE_DST}/ccsweatherdatalogger.service"

echo "Removing ccsweatherdatalogger files"
rm -rf "${WEATHERDATALOGGER_DST}" 
rm -rf "${VENV_DST}" 

echo "Uninstall complete"

