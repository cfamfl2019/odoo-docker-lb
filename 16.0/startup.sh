#!/bin/bash

function install_vuestorefront() {
    if [ ! -d "/mnt/extra-addons/graphql_vuestorefront" ];
    then 
        git clone --recurse-submodules --branch 16.0 https://github.com/odoogap/vuestorefront.git /mnt/extra-addons/
        /entrypoint.sh odoo -d v16_odoo --max-cron-threads 0 --no-http --stop-after-init -i graphql_vuestorefront
        /entrypoint.sh odoo shell -d v16_odoo --max-cron-threads 0 --stop-after-init --no-http < /start_script.py 
        exit 0
    fi
}
function install_modules() {
    if [ ! -d "/mnt/extra-addons/session_redis" ];
    then 
        git clone --recurse-submodules --branch 16.0 https://github.com/camptocamp/odoo-cloud-platform.git /mnt/extra-addons/
        /entrypoint.sh odoo -d v16_odoo --max-cron-threads 0 --no-http --stop-after-init -i session_redis base_attachment_object_storage kwkhtmltopdf_assets attachment_s3  
        /entrypoint.sh odoo shell -d v16_odoo --max-cron-threads 0 --stop-after-init --no-http < /start_script.py 
        exit 0
    fi
}
install_modules && install_vuestorefront && /entrypoint.sh odoo
exit 0
