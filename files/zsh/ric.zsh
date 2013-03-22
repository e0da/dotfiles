RIC=$HOME/code/ric
alias pview="python $RIC/remote_capture/pickle_to_cap.py"
export PYTHONPATH=$RIC/src:$PYTHONPATH
export PATH=$RIC/src:$RIC/tools:$PATH

function workon_ric() {
  echo ${PS1} | grep ric2.5 > /dev/null
  if [ $? -eq 1 ]; then
    workon ric2.5
  fi
}

function ric() {
  cd ${RIC}
  workon_ric
}

function pickles() {
  ric
  cd src/nutricate/tests/rparse/pickles
}
