/*
<command>
node myapp-launch-manager.js up
node myapp-launch-manager.js down

*/

///////////////////// SET YOUR ENVIRONMENT ////////////////////////////////////////////////////////
const APPLICATION1_PATH = "C:\\kaki\\COMPANY_ROOT\\MY_PROJECT\\DOCKER_CONF_SAVED_DIR\\application\\";
const APPLICATION2_PATH = "C:\\kaki\\COMPANY_ROOT\\MY_PROJECT\\DOCKER_CONF_SAVED_DIR\\application\\container\\";
const APPLICATION3_PATH = "C:\\kaki\\COMPANY_ROOT\\MY_PROJECT\\DOCKER_CONF_SAVED_DIR\\application\\myapp\\";
///////////////////////////////////////////////////////////////////////////////////////////////////

const DOCKER_FILE_NAME = "docker-compose.yml";

const UP_COMMAND   = "up";
const DOWN_COMMAND = "down";

let commandCategory;

//==========< Check argument >==========
if( process.argv.length <= 2){
    console.error('Argument error. This command requires an argument "up" or "down" ');
    process.exit(1);

}else{
    commandCategory = process.argv[2];

    if( commandCategory != UP_COMMAND && commandCategory != DOWN_COMMAND ){
        console.error('Argument error. This command requires an argument "up" or "down" ');
        process.exit(1);
    }
}

//==========< Execute >==========
const exec = require('child_process').exec
let callback;


switch (commandCategory) {
    case UP_COMMAND:
        executeUpCommand();
        break;
    case DOWN_COMMAND:
        executeDownCommand();
        break;
    default:
        break;
}


//---------------------------
//    docker-composer-up
//---------------------------
function executeUpCommand(){

    let command_01 = "docker-compose -f " + APPLICATION1_PATH + DOCKER_FILE_NAME + " up -d --build";
    let command_02 = "docker-compose -f " + APPLICATION2_PATH + DOCKER_FILE_NAME + " up -d --build";
    let command_03 = "docker-compose -f " + APPLICATION3_PATH + DOCKER_FILE_NAME + " up -d --build";

    exec(command_01);
    exec(command_02);
    exec(command_03);

    console.log('"docker-composer-up" executed');
}


//---------------------------
//    docker-compose down
//---------------------------
function executeDownCommand(){
    exec("cd " + APPLICATION1_PATH + " && docker-compose down");
    exec("cd " + APPLICATION2_PATH + " && docker-compose down");
    exec("cd " + APPLICATION3_PATH + " && docker-compose down");

    console.log('"docker-compose down" executed');
}

