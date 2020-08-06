#!/bin/sh
cd $JMETER_HOME
echo "JMX File: $JMX"

# log
jmeter -n -t /jmeter/scripts/"$JMX" -l logs.jtl -Jtoken_count="$TOKENS" -Juser_count="$USERS" -Jtotal_seconds_per_user="$SECONDS" -Jrequests_per_user="$REQUESTS"

# report
java -jar $JMETER_HOME/lib/cmdrunner-2.2.jar --tool Reporter --plugin-type AggregateReport --input-jtl logs.jtl --generate-csv /jmeter/reports/report.csv