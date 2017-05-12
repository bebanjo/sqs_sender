EMA Avails
============================


#### Run the script

Edit the code in `companies/disney-abc/emaa/bin/run` and customize the call. E.g., next values will return Avails from two days ago for Disney ABC:

* Name of the company. E.g `disney_abc`
* Name of the company expected in the XML. E.g.: `ABC`
* Start date for the results: E.g.: `DateTime.now - 2.days`
* Number of days beginning with the `start date`. E.g.: `2`

Then execute from command line:

```
/scripts/companies/disney-abc/emma $> ./bin/run
```


