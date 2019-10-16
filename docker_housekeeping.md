# Docker Housekeeping

A common issue I ran into, areold images which block HD space. These are images have no relationship to any tagged images and containers. Locally you could just go with a:

    docker system prune -a

but this will delete all unused images (those which are not referenced by a container) and networks and even stopped containers (but not volumes).

So to just remove dangling images you could go with:

    docker rmi $(docker images --filter "dangling=true" -q --no-trunc)

If you really want to get rid of all containers you could go with a hard removing of everything:

    # Delete all containers
    docker rm $(docker ps -a -q)

    # Delete all images
    docker rmi $(docker images -q)

This is really helpful to clean up your local HD in case you messed up something while setting up your containers.
