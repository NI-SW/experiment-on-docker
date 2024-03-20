This is an explanation file of svn experiment in docker
you can simply use just a few lines of command to start a SVN server.

For example:
    
    startup:
        mkdir ./data
        docker build -t mysvn:latest .
        docker-compose up -d

    shutdown:
        docker-compose down

    restart:
        rm ./config
        docker-compose up -d

You can access your svn repositories at: svn://127.0.0.1:53690/ or at svn://{hostip}:53690/
After you startup your svn server once, ./data will be configure by svn server, remove ./config to avoid reinitialize.
















