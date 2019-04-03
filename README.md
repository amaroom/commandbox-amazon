CommandBox on AmazonLinux
=========================

CommandBox provides a simple yet powerful way to work with ColdFusion. To
Find out more about CommandBox, visit [the CommandBox website](https://commandbox.ortusbooks.com).

Tags
----

* `lucee`, `latest` [(commandbox-amazon/blob/master/Dockerfile)](https://github.com/amaroom/commandbox-amazon/blob/master/Dockerfile)
* `railo` [(commandbox-amazon/blob/railo/Dockerfile)](https://github.com/amaroom/commandbox-amazon/blob/railo/Dockerfile)

How to use this image
---------------------

The container folder `/web/ROOT` is the application root for the server.

The container service port is `8080`.

### Bind your work folder to a running container

    $ docker run \
        -v my/work/code/:/web/ROOT/ \
        -p 8080:8080 \
        -d amaroom/commandbox-amazon

### Build an image with your code in it
Modify or create a `Dockerfile`

    FROM: amaroom/commandbox-amazon

    COPY /my/work/folder/:/web/ROOT/

You can then build and run the Docker image:

    $ docker build -t my-cfapp .
    $ docker run -p 8080:8080 -d my-cfapp

You can also use the Docker image directly from Docker Hub

    docker pull amaroom/commandbox-amazon


Additional Library Files
------------------------

Any files place in the `lib/` folder of the project before a build, or bound to 
the container path `/web/lib/`, are available to the Java framework to scan for 
classes. This is a good place to place any of your Java JAR dependencies.

Modify Server Settings
----------------------

### `Server.json`

You can modify the `server.json` file in this project to change many coldfusion
and java settings. Visit the CommandBox website](https://commandbox.ortusbooks.com) 
for more information on how to use `server.json`.

### Server files in `servlet-home/` folder

Traditionally, the Lucee (and Railo) servers had a _Server_ and _Web_ context. 
This was split up into seperate context folders. These folders contained
configuration information and settings for each application _Web_ context, and 
a single global _Server_ context. The _Server_ context and any _Web_ contexts
are located in the container path `/web/servlet-home/WEB-INF`.

Configuration settings for _Web_ and _Server_ contexts, such as the 
file `railo-web.xml.cfm` for _Web_ contexts and `railo-server.xml` for the _Server_
context, are in their respective folders and can be replace or overridden with binding.

#### Example context paths

* Server context
    * `/web/servlet-home/WEB-INF/railo-server/context`
        * Contains configuration file `railo-server.xml`
* Web context
    * `/web/servlet-home/WEB-INF/railo-web`
        * Contains configuration file `railo-web.xml.cfm`