var config = {}

config.host = process.env.cosmosdb_AccountEndpoint;
config.authKey = process.env.cosmosdb_AccountKey;
config.databaseId = "ToDoList";
config.collectionId = "Items";

module.exports = config;