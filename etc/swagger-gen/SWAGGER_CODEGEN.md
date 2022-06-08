# Swagger Codegen

#Install

brew install swagger-codegen

# Generate APIs

Run the following commands in a terminal:

cd {PROJECT DIRECTORY HERE}/etc/swagger-codegen
swagger-codegen generate -c config.json  -i  api-json.json -o ../../Data/Data/Swagger -l swift5 --type-mappings object=JSONValue


# Docs

https://github.com/swagger-api/swagger-codegen

# Important Note:

1- After generating the code, you'll encounter error "cannot have a stored property that recursively contains it". 
To fix it, you have to convert `Trip` & `Car` to classes instead of structs.

2- We use `--type-mappings object=JSONValue` to avoid having `Any` in the models because it doesn't conform to `Codable`.

## Cloning Swagger Codegen

git clone https://github.com/swagger-api/swagger-codegen
cd swagger-codegen
mvn clean package

Note that Swagger Codegen requires Java JDK 1.8.

# Get Supported config options

java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar config-help -l swift5

# Docs

https://github.com/swagger-api/swagger-codegen