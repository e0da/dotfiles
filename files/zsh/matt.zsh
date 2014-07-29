KP_BANNER="\033[31m
                                               )  (  (    (
                                         (  )  () @@  )  (( (
                                     (      (  )( @@  (  )) ) (
                                   (    (  ( ()( /---\   (()( (
\033[34m    ________            \033[31m                )  ) )(@ !O O! )@@  ( ) ) )
\033[34m   /   ____)            \033[31m          ) (  ( )( ()@ \ o / (@@@@@ ( ()( )
\033[34m+--|  | o o|            \033[31m         (  )  ) ((@@(@@ !o! @@@@(@@@@@)() (
\033[34m|  \   \___|            \033[31m           ) ( @)@@)@  \033[36mPASSENGER\033[31m  )@@@@@()( )
\033[34m|  /--------\            \033[31m         (@@@@)@@@( /  \033[36mNGINX\033[31m  \ @@@)@@@@@(  .
\033[34m| |    \==========______/|\033[31m@@@@@@@@@@@@@(@@@  \033[36mMULTIPLEXER_CTL\033[31m @(@@@(@@@ .  .
\033[34m|  \    \\=========------\|\033[31m@@@@@@@@@@@@@@@@@  \033[36mSCHEDULER_CTL\033[31m  @@(@@)@@ @   .
\033[34m|   \    \----+--\-))) \033[31m          @@@@@@@@@@ !!  \033[36mMEMCACHED\033[31m  !! @@)@@@ .. .
\033[34m|   |\______|_)))/   \033[31m          .    @@@@@@ !!  \033[36mTERMINAL\033[31m  !! @@(@@@ @ . .
\033[34m \__==========      \033[31m     *        .    @@ /MM  /\O   O/\  MM\ @@@@@@@. .
\033[34m    |   |-\   \    \033[31m      (       .      @ !!!  !! \-/ !!  !!! @@@@@ .
\033[34m    |   |  \   \    \033[31m      )      .     .  @@@@ !!     !!  .(. @.  .. .
\033[34m    |   |   \   \   \033[31m     (    /   .(  . \)). ( |O  )( O! @@@@ . )      .
\033[34m    |   |   /   /  \033[31m       ) (      )).  ((  .) !! ((( !! @@ (. ((. .   .
\033[34m    |   |  /   /   \033[31m()  ))   ))   .( ( ( ) ). ( !!  )( !! ) ((   ))  ..
\033[34m    |   |_<   /   \033[31m( ) ( (  ) )   (( )  )).) ((/ |  (  | \(  )) ((. ).
\033[34m____<_____\\__\__\033[31m(___)_))_((_(____))__(_(___.oooO_____Oooo.(_(_)_)((_
"

function nuke() {
  (
    for signal in TERM INT KILL; do
      pid=$(pgrep $1)
      if [ -z "$pid" ]; then
        return
      fi
      echo "$pid" | while read pid; do
        kill -$signal $pid
        if [ $? = 0 ]; then
          echo "Killed $1 with pid $pid using signal $signal"
          return
        else
          sleep 10
        fi
      done
    done
  ) &
}

function kp() {
  echo -e $KP_BANNER
  for proc in memcached       \
              multiplexer_ctl \
              nginx           \
              passenger       \
              scheduler_ctl   \
              Terminal        ; do
    nuke $proc
  done
}

function retag() {
  rm tags tags 2> /dev/null; ctags --exclude=.git --exclude=tmp --exclude='*.log' -R * `bundle show --paths` 2> /dev/null
}
