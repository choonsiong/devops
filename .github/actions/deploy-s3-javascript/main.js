const core = require('@actions/core');
const github = require('@actions/github');
const exec = require('@actions/exec');


function run() {
    core.notice('Hello from my custom JavaScript action!');
}

run();

// npm init -y
// npm install @actions/core @actions/github @actions/exec