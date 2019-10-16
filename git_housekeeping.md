# Git Housekeeping

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
