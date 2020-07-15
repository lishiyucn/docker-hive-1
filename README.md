This repo exists to support basic integration testing for [Apache Hive](http://hive.apache.org/) with [Apache Tez](http://tez.apache.org/).

```bash
# download Hadoop, Hive, Tez artifacts
sh setup.sh
docker build -t hive .
sh run.sh
...

hive> source /hql/test.hql;
OK
Time taken: 4.255 seconds
Query ID = root_20200715224404_d16438e5-deed-428d-98a8-5d72db813ae3
Total jobs = 1
Launching Job 1 out of 1
2020-07-15 22:44:07 Running Dag: dag_1594853046455_0001_1
2020-07-15 22:44:07 Running Dag: dag_1594853046455_0001_1
Status: Running (Executing on YARN cluster with App id application_1594853046455_0001)

----------------------------------------------------------------------------------------------
        VERTICES      MODE        STATUS  TOTAL  COMPLETED  RUNNING  PENDING  FAILED  KILLED  
----------------------------------------------------------------------------------------------
        VERTICES      MODE        STATUS  TOTAL  COMPLETED  RUNNING  PENDING  FAILED  KILLED  
----------------------------------------------------------------------------------------------
Map 1            container       RUNNING      1          0        1        0       0       0  
----------------------------------------------------------------------------------------------
        VERTICES      MODE        STATUS  TOTAL  COMPLETED  RUNNING  PENDING  FAILED  KILLED  
----------------------------------------------------------------------------------------------
Map 1 .......... container     SUCCEEDED      1          1        0        0       0       0  
----------------------------------------------------------------------------------------------
VERTICES: 01/01  [==========================>>] 100%  ELAPSED TIME: 0.31 s     
----------------------------------------------------------------------------------------------
Moving data to directory file:/user/hive/warehouse/test_orc
OK
Time taken: 3.853 seconds
```
