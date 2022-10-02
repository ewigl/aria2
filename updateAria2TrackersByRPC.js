const axios = require('axios')

const trackerType = 'trackers_all.txt'
const trackerUrl = `https://raw.githubusercontent.com/ngosang/trackerslist/master/${trackerType}`

const rpcURL = "http://localhost:6800/jsonrpc"
const rpcToken = 992017

function getTrackersFromGithub() {
    console.log("gettingTrackersFromGithub...");
    console.log("################################");

    axios.get(trackerUrl)
        .then((res) => {

            console.log("gotTrackersFromGithub,Processing...");
            console.log("################################");

            let trackers = res.data
            let parsedTrackers = trackers.replace(/\n\n/g, ",").slice(0, -1);

            let rpcData = {
                id: "updatetrackers",
                jsonroc: "2.0",
                method: "aria2.changeGlobalOption",
                params: [
                    `token:${rpcToken}`,
                    {
                        "bt-tracker": parsedTrackers
                    }
                ]
            }

            console.log("Sending 2 Aria2...");
            console.log("################################");

            axios.post(rpcURL, rpcData).then((res) => {
                let resBody = res.data
                if (resBody.result === "OK") {
                    console.log("Successfully updated.");
                    console.log("################################");
                }
            })

        })
        .catch((e) => {
            console.log("ERROR:\n", e);
        })
}

getTrackersFromGithub()