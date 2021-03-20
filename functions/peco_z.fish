function peco_z
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  z -l | awk '{ print $2 }' | peco $peco_flags | read recent
  if [ $recent ]
      cd $recent
      commandline -r ''
      commandline -f repaint
  end
end

