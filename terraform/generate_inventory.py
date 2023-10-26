#!/bin/bash

echo "[bastion]" > inventory.ini
echo "${bastion_ip}" >> inventory.ini
echo "" >> inventory.ini

echo "[ci_cd]" >> inventory.ini
echo "${ci_cd_ip}" >> inventory.ini
echo "" >> inventory.ini

echo "[frontend]" >> inventory.ini
echo "${frontend_ip}" >> inventory.ini
echo "" >> inventory.ini

echo "[backend]" >> inventory.ini
echo "${backend_ip}" >> inventory.ini
echo "" >> inventory.ini

echo "[monitoring]" >> inventory.ini
echo "${monitoring_ip}" >> inventory.ini
echo "" >> inventory.ini

echo "[rds]" >> inventory.ini
echo "${rds_endpoint}" >> inventory.ini
echo "" >> inventory.ini
