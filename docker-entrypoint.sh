#!/bin/sh

if ! test -e /root/.taskrc; then
    echo 'Container NEW.'
    ln -s /root/.task/taskrc /root/.taskrc

    if ! test -e /root/.task/taskrc; then
    	echo 'Container config create.'
    	echo "confirmation=off" > /root/.task/taskrc
    fi

    task config data.location -- /root/.task

    if [ "$TASKD_SERVER" ]; then
    	echo "Sync enable."
        if [[ -f ${CLIENT_CERT_PATH}/client.credentials ]]; then
    	    TASKD_CREDENTIALS=`cat ${CLIENT_CERT_PATH}/client.credentials`
    	fi

    	task config taskd.server 		-- ${TASKD_SERVER}
    	task config taskd.credentials 	-- ${TASKD_CREDENTIALS}
		task config taskd.certificate 	-- ${CLIENT_CERT_PATH}/client.cert.pem
		task config taskd.key 			-- ${CLIENT_CERT_PATH}/client.key.pem
		task config taskd.ca 			-- ${CLIENT_CERT_PATH}/ca.cert.pem
#        task config taskd.trust 		-- strict
    	task add "Doker ${TASKD_SERVER} init with sync. Delete me."
    else
    	task add "Doker hav0k/taskwarrior-web init without sync. Delete me."
    fi
fi

if [ $# -gt 0 ];then
  exec "$@"
else
  exec task-web -F -L
fi
