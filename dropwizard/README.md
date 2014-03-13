## Transmission

#### To Package
```
mvn clean package
```

#### To Start
```
# via maven exec plugin
mvn exec:java

# via fat jar
java -jar target/transmission-*.jar server config.yml

```

[DropWizard](http://dropwizard.codahale.com/)
