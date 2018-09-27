@Library('ascent@plat-336') _

dockerPipeline {
    dockerBuilds = [
        "ascent/fluentd": ".",
    ]

    /*********  Deployment Configuration ***********/
    stackName = "logging"
    serviceName = "fluentd"
    deployWaitTime = 30 //30 secs for service to start

    //Default Deployment Configuration Values
    //composeFiles = ["docker-compose.yml"]
}
