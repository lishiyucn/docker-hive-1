docker run  \
  -v ${PWD}/data:/data \
  -v ${PWD}/hql:/hql \
  -it hive /bin/bash -c 'cd $HIVE_HOME && ./bin/hive'
  #-it hive /bin/bash -c 'cd $HIVE_HOME && ./bin/hive -f /hql/test.hql'
