const core = require('@actions/core');
const github = require('@actions/github');
const exec = require('@actions/exec');


function run() {
    // 1 - get some input values
    const bucket = core.getInput('bucket', { required: true });
    const bucketRegion = core.getInput('bucket-region', { required: true });
    const distFolder = core.getInput('dist-folder', { required: true });

    // 2 - upload files
    const s3Uri = `s3://${bucket}`
    exec.exec(`aws s3 sync ${distFolder} ${s3Uri} --region ${bucketRegion}`)
    
    //core.notice('Hello from my custom JavaScript action!');

    const websiteUrl = `http://${bucket}.s3-website-${bucketRegion}.amazonaws.com`;

    core.setOutput('website-url', websiteUrl); // ::set-output
}

run();

// npm init -y
// npm install @actions/core @actions/github @actions/exec