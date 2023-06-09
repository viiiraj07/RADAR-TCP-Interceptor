#!/bin/bash
version="v1.0.0"
echo "----- Building RADAR INTERCEPTOR $version -----"
echo -e "\n----------------------------------------"
go build -x

dir_name="build_$version"

if [ -d "$dir_name" ]; then
  echo "Directory already exists with the same version, so deleting"
  rm -r -f "$dir_name"
fi

mkdir "$dir_name"
mv ./radar.exe "$dir_name"
cp ./radarconfig.cfg "$dir_name"
cd "$dir_name" || exit
zip -r "$dir_name.zip" .
rm ./radar.exe ./radarconfig.cfg

echo -e "\n\n----------------------------------------"
echo -e "Build Successful, press any key to exit"
read -n 1 -s
exit
