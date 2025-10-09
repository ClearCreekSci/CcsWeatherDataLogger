#!/usr/bin/bash
UNZIP_DST="./unzip"
TOPLEVEL_DST="/opt/ccs"
VENV_DST="${TOPLEVEL_DST}/venv_weatherdataserver"
VENV_LIB_DIR="${VENV_DST}/lib"
SITE_DIR="site-packages"
WEATHERDATASERVER_DST="${TOPLEVEL_DST}/WeatherDataServer"
WEATHERDATALOGGER_DST="${TOPLEVEL_DST}/WeatherDataLogger"
SYSTEMD_SERVICE_DST="/etc/systemd/system"

if [ $# -ne 1 ]; then
     echo "usage: $0 <path to install bundle>"
     exit
fi

if [ ! $EUID -eq 0 ]; then
    echo "Please run this install script as root"
    exit
fi

ping -c 1 google.com > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "Unable to connect to internet to download required Python files. Installation failed."
    exit
fi

echo "Extracting files..."
rm -rf ${UNZIP_DST}
mkdir ${UNZIP_DST}

unzip -q -d ${UNZIP_DST} $1

# Setup up the virtual environment first...
mkdir -p "${TOPLEVEL_DST}" 

echo "Creating Python virtual environment at ${VENV_DST}. This may take some time..."
python -m venv "${VENV_DST}"

echo "Installing required Python packages..."
source "${VENV_DST}/bin/activate"
pip install -r "${UNZIP_DST}/requirements.txt"

for entry in "${VENV_LIB_DIR}"/*
do
    PYTHON_VER=`basename "${entry}"`
done

# Create these directories in case the server gets installed first 
mkdir -p "${WEATHERDATALOGGER_DST}"
mkdir -p "${WEATHERDATALOGGER_DST}/data"

# Setup up the WeatherDataServer files...
mkdir -p "${WEATHERDATASERVER_DST}"

echo "Copying Weather Data Server files..."
cp "${UNZIP_DST}/run.py" "${WEATHERDATASERVER_DST}"
cp -r  "${UNZIP_DST}/manifest.xml" "${WEATHERDATASERVER_DST}"
cp -r  "${UNZIP_DST}/ccs_dlconfig" "${WEATHERDATASERVER_DST}"
cp -r  "${UNZIP_DST}/databrowser" "${WEATHERDATASERVER_DST}"
cp -r  "${UNZIP_DST}/static" "${WEATHERDATASERVER_DST}"
cp -r  "${UNZIP_DST}/templates" "${WEATHERDATASERVER_DST}"
cp "${UNZIP_DST}/system/ccsweatherdataserver.service" "${SYSTEMD_SERVICE_DST}"

echo "Creating ccsweatherdataserver systemd service..."
systemctl daemon-reload
systemctl enable ccsweatherdataserver.service
systemctl start ccsweatherdataserver.service

# FIXME: Check for error on ccsweatherdataserver startup and report it

rm -rf ${UNZIP_DST}

echo "Installation completed succesfully."


