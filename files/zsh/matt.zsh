function nuke()
{
ps ax | pgrep $1 | awk '{print $1}' | xargs kill -15 $1 2> /dev/null ||
ps ax | pgrep $1 | awk '{print $1}' | xargs kill -2 $1 2> /dev/null  ||
ps ax | pgrep $1 | awk '{print $1}' | xargs kill -1 $1 2> /dev/null  ||
ps ax | pgrep $1 | awk '{print $1}' | xargs kill -9 $1 2> /dev/null
}

function kp()
{
for proc in passenger nginx multiplexer_ctl scheduler_ctl memcached; do nuke $proc 2; done && osascript -e 'tell application "Terminal" to quit'
echo -e "\033[31m
                                         )  (  (    (
                                         (  )  () @@  )  (( (
                                     (      (  )( @@  (  )) ) (
                                   (    (  ( ()( /---\   (()( (
\033[34m     _______            \033[31m                )  ) )(@ !O O! )@@  ( ) ) )
\033[34m   <   ____)            \033[31m          ) (  ( )( ()@ \ o / (@@@@@ ( ()( )
\033[34m/--|  |(  o|            \033[31m         (  )  ) ((@@(@@ !o! @@@@(@@@@@)() (
\033[34m|   >   \___|           \033[31m           ) ( @)@@)@  \033[36mPASSENGER\033[31m  )@@@@@()( )
\033[34m|  /---------+           \033[31m         (@@@@)@@@( /  \033[36mNGINX\033[31m  \ @@@)@@@@@(  .
\033[34m| |    \ =========______/|\033[31m@@@@@@@@@@@@@(@@@  \033[36mMULTIPLEXER_CTL\033[31m @(@@@(@@@ .  .
\033[34m|  \   \\=========------\|\033[31m@@@@@@@@@@@@@@@@@  \033[36mSCHEDULER_CTL\033[31m  @@(@@)@@ @   .
\033[34m|   \   \----+--\-))) \033[31m          @@@@@@@@@@ !!  \033[36mMEMCACHED\033[31m  !! @@)@@@ .. .
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
}

function retag() {
  rm tags tags 2> /dev/null; ctags --exclude=.git --exclude=tmp --exclude='*.log' -R * `bundle show --paths` 2> /dev/null
}
