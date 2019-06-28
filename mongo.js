//printjson(db.getCollectionNames())
//db.clusters.find( { "cluster_id": cluster} ).forEach(printjson)
//db.resources.find( { "cluster_id": cluster} ).forEach(printjson)
//db.resourceStats.find().forEach(printjson)

db.clusters.deleteOne( { "cluster_id": cluster } )
db.resources.deleteMany( { "cluster_id": cluster } )
var clusterCount = db.clusters.count()
var resourceCount = db.resources.count()
db.resourceStats.updateOne({}, { $set: { "clusterCount": clusterCount } })
db.resourceStats.updateOne({}, { $set: { "deploymentCount": resourceCount } })

