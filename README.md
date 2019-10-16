# Development Tools, Tips & Tricks and Miscellaneous
Collection of my own bash scripts, tricks and tips for improving my development workflow.


## Git Housekeeping

To keep your local repository clean, you can do a bit of Git magic in the Git bash:

To list all your local branches by name:

    git branch

or just the number

    git branch | wc -l
    
Git has a tendency to pile up stale references, so a:

    git remote prune origin

should clean up those old stale references.

With a

    git fetch -p

you could also enforce Git to prune with every fetch. In my experience this doesn't always help tho.

### Cleaning up your local repo

So if nothing helps and you are still stuck with stale local branches, you could list all local branches, search for all without an origin (origin/.\*:gone), print them to the standard out (one per each line) and run a delete on each of them:

    git branch -vv | grep 'origin/.\*: gone]' | awk '{print $1}' | xargs git branch --delete

This should get rid of all local stale branches. 

If you are unlucky and have a branch with commited but not pushed branches which was merged and deleted, an still want to get rid of it, you must apply a bit of force:

    git branch -vv | grep 'origin/.\*: gone]' | awk '{print $1}' | xargs git branch --delete --force


## Docker Housekeeping

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
