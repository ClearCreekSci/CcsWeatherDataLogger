#!/usr/bin/bash
UNZIP_DST="./unzip"
TOPLEVEL_DST="/opt/ccs"
VENV_DST="${TOPLEVEL_DST}/venv_weatherdatalogger"
VENV_LIB_DIR="${VENV_DST}/lib"
SITE_DIR="site-packages"
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
    echo "Unable to connect to internet. Installation failed."
    exit
fi

# Make sure I2C is turned on...
echo "Enabling I2C..."
raspi-config nonint do_i2c 0

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

# Setup up the WeatherDataLogger files...
mkdir -p "${WEATHERDATALOGGER_DST}"

echo "Copying Weather Data Logger files..."
cp "${UNZIP_DST}/data_logger.py" "${WEATHERDATALOGGER_DST}"
cp -r  "${UNZIP_DST}/plugins" "${WEATHERDATALOGGER_DST}"
cp -r  "${UNZIP_DST}/manifest.xml" "${WEATHERDATALOGGER_DST}"
cp "${UNZIP_DST}/system/ccsweatherdatalogger.service" "${SYSTEMD_SERVICE_DST}"

echo "Creating ccsweatherdatalogger systemd service..."
systemctl daemon-reload
systemctl enable ccsweatherdatalogger.service
systemctl start ccsweatherdatalogger.service

# FIXME: Check for error on ccsweatherdatalogger startup and report it

rm -rf ${UNZIP_DST}

echo "Installation completed succesfully. Please reboot the device"


