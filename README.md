# SQS Sender

## How to run

Create a `config.yml` file based on the `config.example.yml`. You can create as many environments as you need.

E.g., having an `staging` environemnt:

```YAML
staging:
  <<: *default
  queue_name: my_queue_name
```

and a file `example.xlsx` on the `upload` folder, run the process using this command:

```
ENV=staging bin/run example.xlsx
```

